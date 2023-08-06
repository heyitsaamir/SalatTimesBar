//
//  AppIcon.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 8/4/23.
//

import SwiftUI

struct AppIcon: View {
    @Binding var nextSalatTime: String
    
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Asr")
            Text(self.nextSalatTime)
        }
        .padding()
    }
}

#Preview {
    AppIcon(nextSalatTime: .constant("1am"))
}
