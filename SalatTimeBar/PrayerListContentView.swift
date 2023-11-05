//
//  ContentView.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

func textForSalatTime(_ salatTime: SalatTime) -> String {
    return "\(salatTime.type.rawValue) - \(salatTime.time.formatted())"
}

struct PrayerListContentView: View {
    @Binding var currentSalatTimes: Result<CurrentSalatTimes, NetworkError>
    var body: some View {
        return VStack {
            switch self.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                    let current = currentSalatTimes.salatTimes[currentSalatTimeIndex]
                    let arr = currentSalatTimes.salatTimes[currentSalatTimeIndex + 1...currentSalatTimeIndex + 6]
                    ForEach(arr, id: \.self) { elem in
                        if (current.type != .Isha && elem.type == .Fajr) {
                            VStack {
                                Divider()
                                Text(elem.displayText)
                            }
                        } else {
                            Text(elem.displayText)
                        }
                    }
                } else {
                    Text("Unknownn")
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }.padding()
    }
}
