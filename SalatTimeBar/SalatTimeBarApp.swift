//
//  SalatTimeBarApp.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/2/23.
//

import SwiftUI

@main
struct SalatTimeBarApp: App {
    var body: some Scene {
        MenuBarExtra {
            ContentView()
        } label: {
            AppIcon(nextSalatTime: .constant("1am")).onAppear(perform: {
                build()
            })
        }
    }
}
