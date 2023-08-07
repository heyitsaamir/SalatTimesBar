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

struct ContentView: View {
    @Binding var currentSalatTimes: CurrentSalatTimes?
    var body: some View {
        return VStack {
            if let currentSalatTimes = self.currentSalatTimes, let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                let current = currentSalatTimes.salatTimes[currentSalatTimeIndex]
                let arr = currentSalatTimes.salatTimes[currentSalatTimeIndex + 1...currentSalatTimeIndex + 6]
                ForEach(arr, id: \.self) { elem in
                    if (current.type != .Isha && elem.type == .Fajr) {
                        VStack {
                            Text("--")
                            Text(elem.displayText)
                        }
                    } else {
                        Text(elem.displayText)
                    }
                }
            } else {
                Text("Unknown")
            }
        }.padding()
    }
}

#Preview {
    ContentView(currentSalatTimes: .constant(nil))
}
