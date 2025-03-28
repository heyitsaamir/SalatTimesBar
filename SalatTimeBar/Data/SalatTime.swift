//
//  SalatTime.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/5/23.
//

import Foundation

enum SalatType: String, Decodable {
    case Fajr,
         Sunrise,
         Dhuhr,
         Asr,
         Maghrib,
         Isha
    
    var longDescription: String {
        return self.rawValue
    }
    
    var shortDescription: String {
        switch (self) {
        case .Fajr:
            return "F"
        case .Dhuhr:
            return "D"
        case .Asr:
            return "A"
        case .Maghrib:
            return "M"
        case .Isha:
            return "I"
        case .Sunrise:
            return "SR"
        }
    }
    
    var icon: String {
        switch (self) {
        case .Fajr:
            return "sun.horizon.fill"
        case .Dhuhr:
            return "sun.max"
        case .Asr:
            return "sun.haze"
        case .Maghrib:
            return "sun.horizon"
        case .Isha:
            return "moon.fill"
        case .Sunrise:
            return "sunrise.fill"
        }
    }
    
    var arabicDescription: String {
        switch (self) {
        case .Fajr:
            return "فَجْر"
        case .Dhuhr:
            return "ظُهْر"
        case .Asr:
            return "عَصْر"
        case .Maghrib:
            return "مَغْرِب‎"
        case .Isha:
            return "عِشَاء"
        case .Sunrise:
            return "شروق"
        }
    }
}

struct SalatTime: Hashable {
    var type: SalatType
    var time: Date
    
    func fullDisplay(format: Format) -> String {
        let type = self.typeDisplayText(format: format)
        let delimiter = type != "" ? " - " : ""
        return "\(type)\(delimiter)\(self.timeDisplayText)"
    }
    
    func typeDisplayText(format: Format) -> String {
        switch (format) {
        case .Short:
            return self.type.shortDescription
        case .Long:
            return self.type.longDescription
        case .IconOnly:
            return ""
        }
    }
    
    var timeDisplayText: String {
        return self.time.formatted(date: .omitted, time: .shortened)
    }
}

struct CurrentSalatTimes {
    var salatTimes: [SalatTime]
    var currentSalatIndex: Int?
    
    var currentSalatTime: SalatTime? {
        guard let currentSalatIndex = self.currentSalatIndex else {
            return nil
        }
        
        return self.salatTimes[currentSalatIndex]
    }
    
    var nextSalatTime: SalatTime? {
        guard let currentSalatIndex = self.currentSalatIndex, currentSalatIndex + 1 <=  self.salatTimes.count - 1 else {
            return nil
        }
        
        return self.salatTimes[currentSalatIndex + 1]
    }
    
    var recentlyPassedSalatTime: SalatTime? {
        guard let currentSalatIndex = self.currentSalatIndex, currentSalatIndex - 1 >= 0 else {
            return nil
        }
        
        return self.salatTimes[currentSalatIndex - 1]
    }
    
    var salatsForToday: [SalatTime]? {
        guard let currentSalatIndex = self.currentSalatIndex else {
            return nil
        }
        
        // Find fajr
        var fajrIndex = currentSalatIndex - 1
        while (fajrIndex >= 0 && salatTimes[fajrIndex].type != .Fajr) {
            fajrIndex -= 1
        }
        
        // Return nil if no Fajr prayer is found
        if fajrIndex < 0 {
            if salatTimes[currentSalatIndex].type == .Fajr {
                fajrIndex = currentSalatIndex
            } else {
                return nil
            }
        }
        
        let lastIndex = min(salatTimes.count - 1, fajrIndex + 5)    // Fajr + Sunrise + 4 other prayers
        return Array(salatTimes[fajrIndex...lastIndex])
    }
    
    mutating func computeCurrentSalatIndex() {
        let currentDate = Date()
        self.currentSalatIndex = self.salatTimes.firstIndex { salatTime in
            salatTime.time >= currentDate
        }
    }
}

