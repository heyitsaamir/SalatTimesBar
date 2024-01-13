//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

fileprivate struct AppIconForSalatTime: View {
    let salatTime: SalatTime
    @UserSetting(\.format) var format
    
    var body: some View {
        HStack {
            Image(systemName: salatTime.type.icon)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(salatTime.fullDisplay(format: format))
        }
    }
}

struct AppIcon: View {
    @EnvironmentObject var vm: AthanTimings
    @UserSetting(\.visibleTime) var visibleTime
    
    var body: some View {
        switch self.vm.currentSalatTimes {
        case .success(let currentSalatTimes):
            if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                var salatTime = currentSalatTimes.salatTimes[ visibleTime == .Previous && currentSalatTimeIndex - 1 >= 0 ? currentSalatTimeIndex - 1 : currentSalatTimeIndex]
                if (visibleTime == .Previous && salatTime.type == .Sunrise && currentSalatTimeIndex - 2 >= 0) {
                    salatTime = currentSalatTimes.salatTimes[currentSalatTimeIndex - 2]
                }
                return AnyView(AppIconForSalatTime(salatTime: salatTime))
            } else {
                return AnyView(Text("Foo"))
            }
        case .failure(let error):
            switch error {
            case .AddressNotSet:
                return AnyView(Text("Update settings"))
            case .InvalidData:
                return AnyView(Text("API Error"))
            case .NotAsked:
                return AnyView(ProgressView())
            case .InvalidDate:
                return AnyView(Text("Unknown"))
            }
        }
    }
}
