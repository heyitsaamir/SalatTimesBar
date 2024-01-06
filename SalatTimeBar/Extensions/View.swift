//
//  View.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 1/6/24.
//

import SwiftUI

extension View {
    func glow(color: Color = .white, radius: CGFloat = 12) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
