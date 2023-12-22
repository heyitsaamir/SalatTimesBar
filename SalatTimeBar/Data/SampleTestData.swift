//
//  SampleTestData.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/6/23.
//

import Foundation

let originalPrayerTimings = [
    "Fajr",
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Sunset",
    "Maghrib",
    "Isha",
    "Imsak",
    "Midnight",
    "Firstthird",
    "Lastthird"
]

/**
 For each day of the month of "currentTime",
 Start with the currentTime for Fajr, then add intervalBetweenEach to it and assign it to the next prayer timing
 Return an object similar to below with timings updated, date object updated to reflect the appropriate date. Ignore hijri. And return the same object for meta
 {
 "timings": {
 "Fajr": "2023-08-01T03:58:00-07:00 (PDT)",
 "Sunrise": "2023-08-01T05:46:00-07:00 (PDT)",
 "Dhuhr": "2023-08-01T13:15:00-07:00 (PDT)",
 "Asr": "2023-08-01T17:18:00-07:00 (PDT)",
 "Sunset": "2023-08-01T20:43:00-07:00 (PDT)",
 "Maghrib": "2023-08-01T20:43:00-07:00 (PDT)",
 "Isha": "2023-08-01T22:31:00-07:00 (PDT)",
 "Imsak": "2023-08-01T03:48:00-07:00 (PDT)",
 "Midnight": "2023-08-02T01:15:00-07:00 (PDT)",
 "Firstthird": "2023-08-01T23:44:00-07:00 (PDT)",
 "Lastthird": "2023-08-01T02:45:00-07:00 (PDT)"
 },
 "date": {
 "readable": "01 Aug 2023",
 "timestamp": "1690905661",
 "gregorian": {
 "date": "01-08-2023",
 "format": "DD-MM-YYYY",
 "day": "01",
 "weekday": {
 "en": "Tuesday"
 },
 "month": {
 "number": 8,
 "en": "August"
 },
 "year": "2023",
 "designation": {
 "abbreviated": "AD",
 "expanded": "Anno Domini"
 }
 },
 "hijri": {
 "date": "14-01-1445",
 "format": "DD-MM-YYYY",
 "day": "14",
 "weekday": {
 "en": "Al Thalaata",
 "ar": "الثلاثاء"
 },
 "month": {
 "number": 1,
 "en": "Muḥarram",
 "ar": "مُحَرَّم"
 },
 "year": "1445",
 "designation": {
 "abbreviated": "AH",
 "expanded": "Anno Hegirae"
 },
 "holidays": []
 }
 },
 "meta": {
 "latitude": 47.492615,
 "longitude": -122.149167,
 "timezone": "America/Los_Angeles",
 "method": {
 "id": 2,
 "name": "Islamic Society of North America (ISNA)",
 "params": {
 "Fajr": 15,
 "Isha": 15
 },
 "location": {
 "latitude": 39.70421229999999,
 "longitude": -86.39943869999999
 }
 },
 "latitudeAdjustmentMethod": "ANGLE_BASED",
 "midnightMode": "STANDARD",
 "school": "STANDARD",
 "offset": {
 "Imsak": 0,
 "Fajr": 0,
 "Sunrise": 0,
 "Dhuhr": 0,
 "Asr": 0,
 "Maghrib": 0,
 "Sunset": 0,
 "Isha": 0,
 "Midnight": 0
 }
 }
 }
 */

// Define an OrderedDictionary to maintain order
struct OrderedDictionary<Key: Hashable, Value> {
    private(set) var keys: [Key] = []
    private(set) var values: [Key: Value] = [:]
    
    mutating func insert(value: Value, forKey key: Key, at index: Int) {
        if values[key] == nil {
            keys.insert(key, at: index)
        }
        values[key] = value
    }
}

func generatePrayerTimingsForMonth(currentTime: Date, intervalBetweenEach: Int = 15) -> SalatTimesJson {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    var currentDate = currentTime.startOfMonth
    var prayerTimingsForMonth: [SalatTimeDay] = []
    
    // Get the current month
    let currentMonth = calendar.component(.month, from: currentTime)
    let hour = calendar.component(.hour, from: currentTime)
    let minute = calendar.component(.minute, from: currentTime)
    let second = calendar.component(.second, from: currentTime)
    
    while calendar.component(.month, from: currentDate) == currentMonth {
        var prayerTimings: [String: String] = [:]
        
        
        var prayerTime = calendar.date(bySettingHour: hour, minute: minute, second: second, of: currentDate)!
        for prayer in originalPrayerTimings {
            prayerTimings[prayer] = prayerTime.ISO8601Format()
            prayerTime = prayerTime.computeDate(byAdding: .second, value: intervalBetweenEach)
        }
        
        let dateString = dateFormatter.string(from: currentDate)
        prayerTimingsForMonth.append(SalatTimeDay(timings: prayerTimings, date: createDateObject(date: currentDate)))
        
        currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    return SalatTimesJson(data: prayerTimingsForMonth)
}

// Helper function to create the "date" object
func createDateObject(date: Date) -> SalatTimeDate {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMM yyyy"
    
    return SalatTimeDate(readable: dateFormatter.string(from: date), timestamp: String(Int(date.timeIntervalSince1970)))
}

// Helper function to create the "meta" object
func createMetaObject() -> [String: Any] {
    return [
        "latitude": 47.492615,
        // Add other meta data components as needed...
    ]
}
