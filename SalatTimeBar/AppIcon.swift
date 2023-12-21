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
                    Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText(format: format))
                }
            default:
                Text("Unknown")
            }
        }
        .padding()
    }
}
