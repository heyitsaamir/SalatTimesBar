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
    
    mutating func computeCurrentSalatIndex() {
        let currentDate = Date()
        self.currentSalatIndex = self.salatTimes.firstIndex { salatTime in
            salatTime.time >= currentDate
        }
    }
}

