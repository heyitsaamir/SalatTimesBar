//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct AppIcon: View {
    @EnvironmentObject var vm: AthanTimings
    
    private func buildIcon(for salatTime: SalatTime) -> some View {
        Image(systemName: salatTime.type.getIcon())
                .imageScale(.large)
                .foregroundStyle(.tint)
    }
    
    var body: some View {
        HStack {
            switch self.vm.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                    self.buildIcon(for: currentSalatTimes.salatTimes[currentSalatTimeIndex])
                    Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText)
                }
            default:
                Text("Unknown")
            }
        }
        .padding()
    }
}
