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

fileprivate struct SingleSalatTimeView: View {
    var salatTime: SalatTime
    var body: some View {
        return HStack {
            Image(systemName: self.salatTime.type.getIcon())
            Text(self.salatTime.displayText)
        }.padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
    }
}

struct PopupWindow: View {
    @EnvironmentObject var athanTimings: AthanTimings
    
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
                                Divider().frame(width: 80)
                                SingleSalatTimeView(salatTime: futureSalatTime)
                            }
                        } else {
                            SingleSalatTimeView(salatTime: futureSalatTime)
                        }
                    }
                } else {
                    Text("Unknown")
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }.padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

//#Preview {
//    ContentView(currentSalatTimes: .constant(nil))
//}
