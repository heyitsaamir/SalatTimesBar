//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct AppIcon: View {
    @EnvironmentObject var vm: AthanTimings
    @UserSetting(\.format) var format
    @UserSetting(\.visibleTime) var visibleTime
    
    private func buildIcon(for salatTime: SalatTime) -> some View {
        Image(systemName: salatTime.type.icon)
            .imageScale(.large)
            .foregroundStyle(.tint)
    }
    
    var body: some View {
        HStack {
            switch self.vm.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                    self.buildIcon(for: currentSalatTimes.salatTimes[currentSalatTimeIndex])
                    Text(currentSalatTimes.salatTimes[ visibleTime == .Previous && currentSalatTimeIndex - 1 >= 0 ? currentSalatTimeIndex - 1 : currentSalatTimeIndex].displayText(format: format))
                }
            default:
                Text("Unknown")
            }
        }
        .padding()
    }
}
