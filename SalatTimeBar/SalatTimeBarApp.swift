//
//  SalatTimeBarApp.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

@main
struct SalatTimeBarApp: App {
    @State var currentSalatTime: CurrentSalatTimes?
    var body: some Scene {
        MenuBarExtra {
            ContentView(currentSalatTimes: self.$currentSalatTime)
        } label: {
            AppIcon(currentSalatTimes: self.$currentSalatTime).onAppear(perform: {
                let salatTimes = build()
                var currentSalatTimes = CurrentSalatTimes(salatTimes: salatTimes)
                currentSalatTimes.computeCurrentSalatIndex()
                self.currentSalatTime = currentSalatTimes
            })
        }
    }
}
