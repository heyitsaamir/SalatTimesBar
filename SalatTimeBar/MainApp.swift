//
//  SalatTimeBarApp.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

struct SalatTimeBarApp: App {
    @StateObject var vm = AthanTimings.shared
    @UserSetting(\.address) var address
    @UserSetting(\.salatSchool) var salatSchool
    
    var body: some Scene {
        MenuBarExtra {
            PopupWindow().environmentObject(vm)
        } label: {
            AppIcon().environmentObject(vm).task {
                vm.refresh()
            }
        }
        .menuBarExtraStyle(.window)
        .onChange(of: address) {
            vm.refresh()
        }.onChange(of: salatSchool) {
            vm.refresh()
        }
        
        Window("Settings", id: "UserSettings", content: {
            UserSettingsContentView().fixedSize()
        }).windowResizability(.contentSize).windowStyle(.titleBar)
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup {
        }
    }
}

@main
struct MainEntryPoint {
    static func main() {
        guard isProduction() else {
                    TestApp.main()
                    return
        }
        SalatTimeBarApp.main()
    }
    
    private static func isProduction() -> Bool {
        return NSClassFromString("XCTestCase") == nil
    }
}
