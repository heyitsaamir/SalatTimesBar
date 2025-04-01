//
//  View.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 1/6/24.
//

import SwiftUI

let DEFAULT_GLOW_COLOR = Color.white.opacity(0.1)

extension View {
    func glow(color: Color = DEFAULT_GLOW_COLOR, radius: CGFloat = 12) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
