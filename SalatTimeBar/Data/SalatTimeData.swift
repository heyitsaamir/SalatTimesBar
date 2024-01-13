//
//  SalatTimeData.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/5/23.
//

import Foundation
import Alamofire
import BackgroundTasks

struct SalatTimeDate: Decodable {
    var readable: String
    var timestamp: String
    
    var date: Date? {
        if let timeIntervalSince1970 = Double(self.timestamp) {
            return Date(timeIntervalSince1970: timeIntervalSince1970)
        }
        
        return nil
    }
}

struct SalatTimeDay: Decodable {
    var timings: [String: String]
    var date: SalatTimeDate
}

struct SalatTimesJson: Decodable {
    var data:[SalatTimeDay]
}

struct SalatTimeErrorJson: Decodable {
    var code: Int
    var status: String
    var data: String?
}

let isoFormatter = ISO8601DateFormatter()

enum NetworkError: Error {
    // Throw when an invalid password is entered
    case InvalidDate(internalError: String? = nil)
    
    case InvalidData(internalError: String? = nil)
    
    case NotAsked(internalError: String? = nil)
    
    case AddressNotSet(internalError: String? = nil)
    
    var description: String {
        get {
            switch self {
            case .AddressNotSet:
                return "Address was not set. Please check Settings"
            case .InvalidData(let internalError):
                return "There was some trouble getting information from the service. Please try again in a bit \(internalError != nil ? " - \(internalError!)" : "")"
            case .InvalidDate:
                return "Something went wrong with the date"
            case .NotAsked:
                return "The salat times are being retrieved"
            }
        }
    }
}

struct Parameters: Encodable {
    let address: String
    let month: Int
    let year: Int
    let iso8601: String
    let school: Int
}

struct CurrentParameter: Hashable {
    let address: String
    let salatSchool: SalatSchool
}

fileprivate typealias StoredSalatTimes = (startOfMonthDate: Date, times: [SalatTime])

class AthanTimings: ObservableObject {
    static let shared = AthanTimings()
    
    private let userSettings: UserSettings
    private let notifications: AppNotifications
    private let fetcher: AthanNetworkFetcher
    private var timer: Timer?
    private let dispatchQueue = DispatchQueue(label: "Salat Time Serial Queue")
    private var currentParameter: CurrentParameter?
    @Published var currentSalatTimes = Result<CurrentSalatTimes, NetworkError>.failure(.NotAsked(internalError: nil))
    
    init(userSettings: UserSettings = .shared, notifications: AppNotifications = .shared) {
        fetcher = AthanNetworkFetcher()
        self.userSettings = userSettings
        self.notifications = notifications
    }
    
    deinit {
        print("Invalidating timer");
        timer?.invalidate()
    }
    
    func fetch() async -> Void {
        let currentMonth = Date.now.startOfMonth
        let nextMonth = currentMonth.computeDate(byAdding: .month, value: 1).startOfMonth
        print("[\(Date.now.ISO8601Format())] fetching for \(currentMonth.description) \(nextMonth.description)")
        do {
            let dataForCurrentDate = try await self.fetcher.fetchAthanTimesIfNecessary(for: currentMonth, address: self.userSettings.address, salatSchool: self.userSettings.salatSchool)
            let dataForNextMonthDate = try await self.fetcher.fetchAthanTimesIfNecessary(for: nextMonth, address: self.userSettings.address, salatSchool: self.userSettings.salatSchool)
            DispatchQueue.main.async {
                var salatTimes: [SalatTime] = []
                var hasErrored = false
                [dataForCurrentDate, dataForNextMonthDate].forEach { data in
                    switch data {
                    case .success(let json):
                        salatTimes += json.times
                        self.currentParameter = CurrentParameter(address: self.userSettings.address, salatSchool: self.userSettings.salatSchool)
                    case .failure(let error):
                        self.currentSalatTimes = .failure(error)
                        hasErrored = true
                    }
                }
                
                if !hasErrored {
                    let currentSalatTimes = CurrentSalatTimes(salatTimes: salatTimes)
                    self.currentSalatTimes = .success(currentSalatTimes)
                    self.computeCurrentSalatIndex()
                }
                
                self.scheduleNotification()
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func scheduleTimer() {
        self.timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true, block: { [weak self] timer in
            guard let self = self, timer.isValid else {
                return
            }
            
            // Do I need to run again?
            if !self.shouldRun {
                print("[\(Date.now)] No need to run.")
                return
            } else {
                print("[\(Date.now)] Running")
            }
            
            self.dispatchQueue.async {
                Task {
                    await self.fetch()
                }
            }
        })
        
        timer?.fire()
    }
    
    private var shouldRun: Bool {
        if let currentParameter = self.currentParameter, (currentParameter.address != self.userSettings.address || currentParameter.salatSchool != self.userSettings.salatSchool) {
            return true
        }
        switch (self.currentSalatTimes) {
        case .success(let salatTimes):
            let currentSalatTime = salatTimes.currentSalatTime
            if let currentSalatTime = currentSalatTime {
                return currentSalatTime.time < Date.now
            } else {
                return true
            }
        case .failure:
            return true
        }
    }
    
    private func computeCurrentSalatIndex() {
        switch (self.currentSalatTimes) {
        case .success(let salatTimes):
            var currentSalatTime = salatTimes
            currentSalatTime.computeCurrentSalatIndex()
            self.currentSalatTimes = .success(currentSalatTime)
        case .failure(let error):
            print("No exisiting salat time because of \(error.localizedDescription)")
        }
    }
    
    private func scheduleNotification() {
        guard self.userSettings.enableNotifications else {
            return
        }
        
        switch (self.currentSalatTimes) {
        case .success(let salatTimes):
            if let currentSalatTime = salatTimes.currentSalatTime, let nextSalatTime = salatTimes.nextSalatTime {
                notifications.resetNotifications()
                notifications.scheduleNotification(for: currentSalatTime, nextSalat: nextSalatTime)
            }
        case .failure:
            break
        }
    }
}

fileprivate class AthanNetworkFetcher {
    private var cache: Dictionary<String, [SalatTime]>
    private let userSettings: UserSettings
    private let errorDecoder = JSONDecoder()
    
    init(userSettings: UserSettings = .shared) {
        self.cache = Dictionary()
        self.userSettings = userSettings
    }
    
    func fetchAthanTimesIfNecessary(for date: Date, address: String, salatSchool: SalatSchool) async throws -> Result<StoredSalatTimes, NetworkError> {
        let components = date.get(.year, .month)
        guard let year = components.year, let month = components.month else {
            return .failure(.InvalidDate(internalError: "Invalid year \(components.year ?? -1) or month \(components.month ?? -1)"))
        }
        
        guard userSettings.address != "" else {
            return .failure(.AddressNotSet(internalError: nil))
        }
        
        let cacheKey = "\(year)|\(month)|\(address)|\(salatSchool.rawValue)"
        
        if let existingResult = self.cache[cacheKey] {
            return .success((startOfMonthDate: date.startOfMonth, times: existingResult))
        }
        
        let networkResult = try await self.fetchAthanTime(for: Parameters(address: address, month: month, year: year, iso8601: "true", school: salatSchool.rawValue))
        
        switch networkResult {
        case .success(let json):
            let results = json.data.flatMap { salatTimeDay in
                return salatTimeDay.timings.compactMap { (key, value) -> SalatTime? in
                    if let salatType = SalatType(rawValue: key), let salatTime = isoFormatter.date(from: value) {
                        return SalatTime(type: salatType, time: salatTime)
                    }
                    
                    return nil
                }
            }.sorted { a, b in
                a.time.compare(b.time) == .orderedAscending
            }
            
            self.cache[cacheKey] = results
            return .success((startOfMonthDate: date.startOfMonth, times: results))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func fetchAthanTime(for parameters: Parameters) async throws -> Result<SalatTimesJson, NetworkError> {
        return try await withCheckedThrowingContinuation { continuation in
            //            continuation.resume(returning: .success(generatePrayerTimingsForMonth(currentTime: Date.now) as! SalatTimesJson))
            AF.request("https://api.aladhan.com/v1/calendarByAddress", method: .get, parameters: parameters)
                .validate(statusCode: 200..<300)
                .responseDecodable(of:SalatTimesJson.self) { response in
                switch response.result {
                case .success(let salatTime):
                    continuation.resume(returning: .success(salatTime))
                case .failure(let error):
                    var internalError: String? = nil
                    if let data = response.data {
                        do {
                            let json = try self.errorDecoder.decode(SalatTimeErrorJson.self, from: data)
                            internalError = json.data != nil ? json.data! : nil
                        } catch {
                            print(error)
                        }
                    }
                    
                    continuation.resume(returning: .failure(NetworkError.InvalidData(internalError: internalError ?? error.localizedDescription)))
                }
            }
        }
    }
}

