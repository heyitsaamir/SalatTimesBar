//
//  ContentView.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

fileprivate class Constants {
    static let MIN_PREV_TIMES_TO_SHOW = 1
    static let MAX_NEXT_TIMES_TO_SHOW = 3
}

func textForSalatTime(_ salatTime: SalatTime) -> String {
    return "\(salatTime.type.rawValue) - \(salatTime.time.formatted())"
}

fileprivate struct SingleSalatTimeView: View {
    var salatTime: SalatTime
    var hasPassed: Bool
    var isNext: Bool
    var body: some View {
        return HStack {
            Image(systemName: self.salatTime.type.icon)
            Text(self.salatTime.displayText(format: .Long))
        }
        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
        .foregroundStyle(hasPassed && salatTime.type != .Sunrise ? Color.accentColor : isNext ? .primary : .secondary)
        .fontWeight(isNext ? .bold : .regular)
        .opacity(hasPassed ? 0.7 : 1.0)
    }
}

struct PopupWindow: View {
    @Environment(\.openWindow) private var openWindow
    @EnvironmentObject var athanTimings: AthanTimings
    
    var body: some View {
       return VStack {
            switch self.athanTimings.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex, currentSalatTimes.salatTimes.count > currentSalatTimeIndex {
                    var firstIndex = getFirstIndex(currentSalatTimes: currentSalatTimes, currentSalatTimeIndex: currentSalatTimeIndex)
                    let finalIndex = min(currentSalatTimeIndex + Constants.MAX_NEXT_TIMES_TO_SHOW, currentSalatTimes.salatTimes.count - 1)
                    let indices = firstIndex...finalIndex
                    ForEach(indices, id: \.self) { idx in
                        let futureSalatTime = currentSalatTimes.salatTimes[idx]
                        if (futureSalatTime.type == .Fajr && idx != firstIndex) {
                            VStack {
                                Divider().frame(width: 80)
                                SingleSalatTimeView(salatTime: futureSalatTime, hasPassed: idx < currentSalatTimeIndex, isNext: idx == currentSalatTimeIndex)
                            }
                        } else {
                            SingleSalatTimeView(salatTime: futureSalatTime, hasPassed: idx < currentSalatTimeIndex, isNext: idx == currentSalatTimeIndex)
                        }
                    }
                } else {
                    Text("Unknown")
                }
            case .failure(let error):
                Text(error.localizedDescription)
            }
           Menu(content: {
               Button("Settings") {
                   openWindow(id: "UserSettings")
               }
               Button("Quit") {
                   NSApplication.shared.terminate(nil)
               }
           }) {
               Image(systemName: "gear")
                   .imageScale(.small)
           }.buttonStyle(.accessoryBar)
               .foregroundStyle(.secondary)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .background(Color.background)
    }
    
    func getFirstIndex(currentSalatTimes: CurrentSalatTimes, currentSalatTimeIndex: Int) -> Int {
        var firstIndex = max(currentSalatTimeIndex - Constants.MIN_PREV_TIMES_TO_SHOW, 0)
        if (firstIndex != currentSalatTimeIndex && currentSalatTimes.salatTimes[firstIndex].type == .Sunrise) {
            firstIndex = max(firstIndex - 1, 0)
        }
        
        return firstIndex
    }
}
