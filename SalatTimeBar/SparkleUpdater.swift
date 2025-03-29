//
//  SparkleUpdater.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 3/29/25.
//

import SwiftUI
import Sparkle

// This view model class publishes when new updates can be checked by the user
final class CheckForUpdatesViewModel: ObservableObject {
    static let shared = CheckForUpdatesViewModel()
    
    @Published var canCheckForUpdates = false

    init() {
        SPUStandardUpdaterController.shared.updater.publisher(for: \.canCheckForUpdates)
            .assign(to: &$canCheckForUpdates)
    }
}

// This is the view for the Check for Updates menu item
// Note this intermediate view is necessary for the disabled state on the menu item to work properly before Monterey.
// See https://stackoverflow.com/questions/68553092/menu-not-updating-swiftui-bug for more info
struct CheckForUpdatesView: View {
    @ObservedObject private var checkForUpdatesViewModel: CheckForUpdatesViewModel
    
    init() {
        // Create our view model for our CheckForUpdatesView
        self.checkForUpdatesViewModel = CheckForUpdatesViewModel()
    }
    
    var body: some View {
        Button("Check for Updates…", action: SPUStandardUpdaterController.shared.updater.checkForUpdates)
            .disabled(!checkForUpdatesViewModel.canCheckForUpdates)
    }
}
