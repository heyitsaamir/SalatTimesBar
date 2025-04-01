//
//  SparkleUpdater.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 3/29/25.
//

import SwiftUI
import Sparkle

// This view model class publishes when new updates can be checked by the user
final class CheckForUpdatesViewModel: NSObject, ObservableObject, SPUStandardUserDriverDelegate {
    static let shared = CheckForUpdatesViewModel()
    
    @Published var canCheckForUpdates = false
    @Published var updateAvailable = false
    private var cancellable: Any?

    override init() {
        super.init()
        // Delay setup until next runloop to avoid initialization order issues
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.cancellable = SPUStandardUpdaterController.shared.updater.publisher(for: \.canCheckForUpdates)
                .assign(to: &self.$canCheckForUpdates)
        }
    }
    
    // MARK: - SPUStandardUserDriverDelegate
    
    var supportsGentleScheduledUpdateReminders: Bool {
        return true
    }
    
    func standardUserDriverWillHandleShowingUpdate(_ handleShowingUpdate: Bool, forUpdate update: SUAppcastItem, state: SPUUserUpdateState) {
        DispatchQueue.main.async {
            self.updateAvailable = true
        }
    }
    
    func standardUserDriverWillFinishUpdateSession() {
        DispatchQueue.main.async {
            self.updateAvailable = false
        }
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
