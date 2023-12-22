//
//  SalatTimeBarApp.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

@main
struct SalatTimeBarApp: App {
    @StateObject var vm = AthanTimings.shared
    @UserSetting(\.address) var address
    @UserSetting(\.salatSchool) var salatSchool
    
    var body: some Scene {
        MenuBarExtra {
            PopupWindow().environmentObject(vm)
        } label: {
            AppIcon().environmentObject(vm).task {
                vm.scheduleTimer()
            }
        }
        .menuBarExtraStyle(.window)
        .onChange(of: address) {
            vm.scheduleTimer()
        }.onChange(of: salatSchool) {
            vm.scheduleTimer()
        }
        
        Window("Settings", id: "UserSettings", content: {
            UserSettingsContentView().fixedSize()
        }).windowResizability(.contentSize).windowStyle(.titleBar)
    }
}
