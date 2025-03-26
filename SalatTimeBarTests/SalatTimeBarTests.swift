//
//  TimingTests.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 3/24/25.
//

import XCTest
@testable import SalatTimeBar

class MockUserSettings: UserSettings {
    private var _address: String = "Test Address"
    private var _salatSchool: SalatSchool = .Hanafi
    private var _enableNotifications: Bool = true

    override var address: String {
        get { _address }
        set { _address = newValue }
    }
        

    override var salatSchool: SalatSchool {
        get { _salatSchool }
        set { _salatSchool = newValue }
    }

    override var enableNotifications: Bool {
        get { _enableNotifications }
        set { _enableNotifications = newValue }
    }
}

class MockNetworkFetcher: AthanNetworkFetcher {
    var mockResult: Result<[SalatTime], NetworkError>?
    
    override func fetchAthanTimesIfNecessary(for date: Date, address: String, salatSchool: SalatSchool) async throws -> Result<StoredSalatTimes, NetworkError> {
        if let mockResult = self.mockResult {
            if case .failure(let error) = mockResult {
                return .failure(error)
            } else if case .success(let times) = mockResult {
                return .success(StoredSalatTimes(startOfMonthDate: date.startOfMonth, times: times))
            }
            return .failure(.InvalidData())
        } else {
            return .failure(.InvalidData())
        }
    }
}

class MockAppNotifications: AppNotifications {
    var scheduledNotifications: [(current: SalatTime, next: SalatTime)] = []
    
    override func scheduleNotification(for currentSalat: SalatTime, nextSalat: SalatTime) {
        scheduledNotifications.append((current: currentSalat, next: nextSalat))
    }
    
    override func resetNotifications() {
        scheduledNotifications.removeAll()
    }
}

class TimingsTests: XCTestCase {
    var sut: AthanTimings!
    var mockSettings: MockUserSettings!
    var mockNotifications: MockAppNotifications!
    var mockFetcher: MockNetworkFetcher!
    
    override func setUp() {
        super.setUp()
        mockSettings = MockUserSettings()
        mockNotifications = MockAppNotifications()
        mockFetcher = MockNetworkFetcher()
        sut = AthanTimings(userSettings: mockSettings, notifications: mockNotifications)
        
        mockFetcher.mockResult = .success([
            SalatTime(type: .Fajr, time: Date()),
            SalatTime(type: .Sunrise, time: Date().addingTimeInterval(60 * 60)),
            SalatTime(type: .Dhuhr, time: Date().addingTimeInterval(2 * 60 * 60)),
            SalatTime(type: .Asr, time: Date().addingTimeInterval(3 * 60 * 60)),
            SalatTime(type: .Maghrib, time: Date().addingTimeInterval(4 * 60 * 60)),
            SalatTime(type: .Isha, time: Date().addingTimeInterval(5 * 60 * 60))
        ])
    }
    
    override func tearDown() {
        sut = nil
        mockSettings = nil
        mockNotifications = nil
        super.tearDown()
    }
    
    func testTimerUpdate() async throws {
            // Given
            let expectation = XCTestExpectation(description: "Timer update")
            let calendar = Calendar.current
            let now = Date()
            let topOfMinute = calendar.date(bySetting: .second, value: 0, of: now)!

            // When
            sut.refresh() // This starts the timers

            // Wait until we're at the start of next minute
            let nextMinute = topOfMinute.addingTimeInterval(60)
            let waitTime = nextMinute.timeIntervalSince(now) + 1 // Add 1 second buffer
            try await Task.sleep(nanoseconds: UInt64(waitTime * 1_000_000_000))

            // Then
            if case .success(let times) = sut.currentSalatTimes {
                XCTAssertEqual(times.currentSalatTime?.type, .Sunrise)
                expectation.fulfill()
            }

            await fulfillment(of: [expectation], timeout: 5)
        }

        func testNotificationScheduling() {
            // Given
            mockSettings.enableNotifications = true
            
            // When
            sut.refresh()
            
            // Then - wait a bit for the async work to complete
            let expectation = XCTestExpectation(description: "Notifications scheduled")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertFalse(self.mockNotifications.scheduledNotifications.isEmpty)
                XCTAssertEqual(self.mockNotifications.scheduledNotifications.first?.current.type, .Fajr)
                XCTAssertEqual(self.mockNotifications.scheduledNotifications.first?.next.type, .Sunrise)
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 2)
        }
}
