//
//  PopupWindow.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

fileprivate class Constants {
    static let MIN_PREV_TIMES_TO_SHOW = 1
    static let MAX_NEXT_TIMES_TO_SHOW = 4
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
            Image(systemName: self.salatTime.type.icon).frame(width: 14.0)
            Text(self.salatTime.typeDisplayText(format: .Long))
            Spacer()
            Text(self.salatTime.timeDisplayText)
        }
        .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
        .foregroundStyle(hasPassed && salatTime.type != .Sunrise ? Color.accentColor : isNext ? .primary : .secondary)
        .fontWeight(isNext || (hasPassed && salatTime.type != .Sunrise) ? .bold : .regular)
        .opacity(hasPassed ? 0.7 : 1.0)
    }
}

fileprivate struct SettingsMenu: View {
    @Environment(\.openWindow) private var openWindow
    @ObservedObject var checkForUpdatesVm = CheckForUpdatesViewModel.shared
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            if self.checkForUpdatesVm.updateAvailable {
                Text("✨").help("New update available!").glow(radius: 5).font(.system(size: 10))
            }
            Menu(content: {
                Button("Settings") {
                    openWindow(id: "UserSettings")
                }
                CheckForUpdatesView()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }) {
                Image(systemName: "gear")
                    .imageScale(.small)
            }.buttonStyle(.accessoryBar)
        }
    }
}

struct PopupWindow: View {
    @EnvironmentObject var athanTimings: AthanTimings
    
    var body: some View {
        return VStack {
            switch self.athanTimings.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex, currentSalatTimes.salatTimes.count > currentSalatTimeIndex {
                    let firstIndex = getFirstIndex(currentSalatTimes: currentSalatTimes, currentSalatTimeIndex: currentSalatTimeIndex)
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
                    if let salatsForToday = currentSalatTimes.salatsForToday {
                        Visualizer(points: salatsForToday.map({ time in
                            VisualizerPoint(time: time.time, icon: time.type.icon, hasPassed: time.time.timeIntervalSinceNow < 0, isActive: currentSalatTimes.recentlyPassedSalatTime?.type == time.type, isNext: currentSalatTimes.currentSalatTime?.type == time.type)
                        })).frame(height: 24)
                    }
                } else {
                    Text("Unknown")
                }
            case .failure(let error):
                Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.yellow)
                Text(error.description).italic().multilineTextAlignment(.center)
            }
            SettingsMenu()
        }
        .padding(EdgeInsets(top: 10, leading:8, bottom: 10, trailing:8))
        .background(Color.background)
        .frame(width: 230)
    }
    
    func getFirstIndex(currentSalatTimes: CurrentSalatTimes, currentSalatTimeIndex: Int) -> Int {
        var firstIndex = max(currentSalatTimeIndex - Constants.MIN_PREV_TIMES_TO_SHOW, 0)
        if (firstIndex != currentSalatTimeIndex && currentSalatTimes.salatTimes[firstIndex].type == .Sunrise) {
            firstIndex = max(firstIndex - 1, 0)
        }
        
        return firstIndex
    }
}

#Preview {
    let mockAthanTimings = AthanTimings.shared
        // Create sample salat times for today
//        let now = Date()
//        let sampleTimes: [SalatTime] = [
//            SalatTime(type: .Fajr, time: now.addingTimeInterval(-3600)), // 1 hour ago
//            SalatTime(type: .Sunrise, time: now.addingTimeInterval(1800)), // 30 min ahead
//            SalatTime(type: .Dhuhr, time: now.addingTimeInterval(7200)), // 2 hours ahead
//            SalatTime(type: .Asr, time: now.addingTimeInterval(14400)), // 4 hours ahead
//            SalatTime(type: .Maghrib, time: now.addingTimeInterval(21600)), // 6 hours ahead
//            SalatTime(type: .Isha, time: now.addingTimeInterval(28800)) // 8 hours ahead
//        ]
        
//        mockAthanTimings.currentSalatTimes = .success(CurrentSalatTimes(salatTimes: sampleTimes))
    mockAthanTimings.currentSalatTimes = .failure(NetworkError.AddressNotSet(internalError: "Error"))
        
        return PopupWindow()
            .environmentObject(mockAthanTimings)
            .frame(width: 230, height: 500)
}
