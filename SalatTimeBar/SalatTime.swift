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

struct SalatTime {
    var type: SalatType
    var time: Date
}

struct CurrentSalatTimes {
    var salatTimes: [SalatTime]
    private var currentSalatIndex: Int?
    
    mutating func computeCurrentSalatIndex() {
        let currentDate = Date()
        self.currentSalatIndex = self.salatTimes.firstIndex { salatTime in
            salatTime.time >= currentDate
        }
    }
}

