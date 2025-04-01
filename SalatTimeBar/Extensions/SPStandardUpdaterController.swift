//
//  SPStandardUpdaterController.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 3/29/25.
//

import Sparkle

extension SPUStandardUpdaterController {
    // MainApp will start the updater when the app launches
    static let shared = SPUStandardUpdaterController(
        startingUpdater: false,
        updaterDelegate: nil,
        userDriverDelegate: CheckForUpdatesViewModel.shared
    )
}
