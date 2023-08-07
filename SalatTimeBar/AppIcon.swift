//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct AppIcon: View {
    @Binding var currentSalatTimes: CurrentSalatTimes?
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            if let currentSalatTimes = self.currentSalatTimes, let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText)
            }
        }
        .padding()
    }
}

#Preview {
    AppIcon(currentSalatTimes: .constant(nil))
}
