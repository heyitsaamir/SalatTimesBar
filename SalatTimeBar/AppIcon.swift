//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct AppIcon: View {
    @Binding var currentSalatTimes: Result<CurrentSalatTimes, NetworkError>
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            switch self.currentSalatTimes {
            case .success(let currentSalatTimes):
                if let currentSalatTimeIndex = currentSalatTimes.currentSalatIndex {
                    Text(currentSalatTimes.salatTimes[currentSalatTimeIndex].displayText)
                }
            default:
                Text("Unknown")
            }
        }
        .padding()
    }
}

//#Preview {
//    AppIcon(currentSalatTimes: .constant(nil))
//}
