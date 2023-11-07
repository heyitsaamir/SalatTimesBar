//
//  SalatTimeBarApp.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

@main
struct SalatTimeBarApp: App {
    @StateObject var vm = AthanTimings()
    var body: some Scene {
        MenuBarExtra {
            ContentView().environmentObject(vm)
        } label: {
            AppIcon().environmentObject(vm).onAppear(perform: {
                vm.fetch()
            })
        }
        .menuBarExtraStyle(.window)
    }
}
