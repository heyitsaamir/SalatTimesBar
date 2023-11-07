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
    @EnvironmentObject var athanTimings: AthanTimings
    fileprivate func buildMenuContent(for salatTime: SalatTime) -> some View {
        return HStack {
            Image(systemName: salatTime.type.getIcon())
            Text(salatTime.displayText)
        }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
    
    var body: some View {
        return VStack {
            switch self.athanTimings.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex, currentSalatTimes.salatTimes.count > currentSalatTimeIndex {
                    let current = currentSalatTimes.salatTimes[currentSalatTimeIndex]
                    let finalIndex = min(currentSalatTimeIndex + 5, currentSalatTimes.salatTimes.count - 1)
                    let arr = currentSalatTimes.salatTimes[currentSalatTimeIndex + 1...finalIndex]
                    ForEach(arr, id: \.self) { futureSalatTime in
                        if (current.type != .Isha && futureSalatTime.type == .Fajr) {
                            VStack {
                                Divider()
                                buildMenuContent(for: futureSalatTime)
                            }
                        } else {
                            buildMenuContent(for: futureSalatTime)
                        }
                    }
                } else {
                    Text("Unknown")
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }.padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
    }
}

//#Preview {
//    ContentView(currentSalatTimes: .constant(nil))
//}
