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
    
    func getIcon() -> String {
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
}

struct SalatTime: Hashable {
    var type: SalatType
    var time: Date
    
    var displayText: String {
        return "\(self.type.rawValue) - \(self.time.formatted(date: .omitted, time: .shortened))"
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

