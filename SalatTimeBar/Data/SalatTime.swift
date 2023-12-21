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
    
    func displayText(format: Format) -> String {
        let type: String
        switch (format) {
        case .Short:
            type = self.type.shortDescription
        case .Long:
            type = self.type.longDescription
        case .IconOnly:
            type = ""
        }
        
        let delimiter = type != "" ? " - " : ""
        return "\(type)\(delimiter)\(self.time.formatted(date: .omitted, time: .shortened))"
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
    
    mutating func computeCurrentSalatIndex() {
        let currentDate = Date()
        self.currentSalatIndex = self.salatTimes.firstIndex { salatTime in
            salatTime.time >= currentDate
        }
    }
}

