//
//  SalatTimeData.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/5/23.
//

import Foundation
import Alamofire
import BackgroundTasks
import UserNotifications

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
                return "The location needs to be set in the settings"
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

typealias StoredSalatTimes = (startOfMonthDate: Date, times: [SalatTime])

class AthanTimings: ObservableObject {
    static let shared = AthanTimings()
    
    private let userSettings: UserSettings
    private let notifications: AppNotifications
    private let fetcher: AthanNetworkFetcher
    private var midnightTimer: Timer?
    private var uiTimer: Timer?
    private let dispatchQueue = DispatchQueue(label: "Salat Time Serial Queue")
    private var currentParameter: CurrentParameter?
    @Published var currentSalatTimes = Result<CurrentSalatTimes, NetworkError>.failure(.NotAsked(internalError: nil))
    
    init(userSettings: UserSettings = .shared, notifications: AppNotifications = .shared) {
        fetcher = AthanNetworkFetcher()
        self.userSettings = userSettings
        self.notifications = notifications
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                if let error = error {
                    print("Notification permission error: \(error)")
                }
            }
    }
    
    func refresh() {
        setupTimers()
    }
    
    deinit {
        print("Invalidating timer");
        midnightTimer?.invalidate()
    }
    
    private func fetch() async -> Void {
        print("[\(Date.now.ISO8601Format())] fetching salat times")
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
    
    private func setupTimers() {
        // Schedule notifications immediately
        scheduleAllNotifications()
        
        // Setup midnight timer for next refresh
        let calendar = Calendar.current
        let midnight = calendar.startOfDay(for: Date().addingTimeInterval(86400))
        midnightTimer = Timer(fire: midnight,
                             interval: 86400,
                             repeats: true) { [weak self] midnightTimer in
            guard let self = self, midnightTimer.isValid else {
                return
            }
            
            Task {
                await self.fetch()
                self.scheduleAllNotifications()
            }
        }
        RunLoop.main.add(midnightTimer!, forMode: .common)
        midnightTimer?.fire()
        let now = Date()
        let nextMinute = calendar.date(bySetting: .second, value: 1, of: now)?.addingTimeInterval(60) ?? now
        
        uiTimer?.invalidate() // Clean up existing timer if any
        uiTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.computeCurrentSalatIndex()
        }
        
        // Delay the timer start to align with minute boundary
        uiTimer?.fireDate = nextMinute
        RunLoop.main.add(uiTimer!, forMode: .common)
    }
    
    
    private func scheduleAllNotifications() {
        guard case .success(let times) = self.currentSalatTimes else { return }
        
        // Clear existing notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Schedule only future prayers for today
        let upcomingTimes = times.salatTimes.filter { $0.time > Date() }
        
        upcomingTimes.forEach { time in
            let content = UNMutableNotificationContent()
            content.title = "Prayer Time"
            content.body = "\(time.type.rawValue) time"
            content.sound = .default
            
            let components = Calendar.current.dateComponents([.hour, .minute],
                                                          from: time.time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components,
                                                      repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "prayer-\(time.type.rawValue)-\(time.time.timeIntervalSince1970)",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Failed to schedule \(time.type.rawValue): \(error)")
                }
            }
        }
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
            print("Notifications are disabled")
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

class AthanNetworkFetcher {
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

