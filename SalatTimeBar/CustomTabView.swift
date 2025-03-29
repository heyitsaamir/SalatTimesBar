//
//  CustomTabView.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 3/28/25.
//

import SwiftUI

public struct CustomTabView: View {
    
    public enum TabBarPosition { // Where the tab bar will be located within the view
        case top
        case bottom
    }
    
    private let tabBarPosition: TabBarPosition
    private let tabText: [String]
    private let tabIconNames: [String?]
    private let tabViews: [AnyView]
    
    @State private var selection = 0
    
    public init(tabBarPosition: TabBarPosition, content: [(tabText: String, tabIconName: String?, view: AnyView)]) {
        self.tabBarPosition = tabBarPosition
        self.tabText = content.map{ $0.tabText }
        self.tabIconNames = content.map{ $0.tabIconName }
        self.tabViews = content.map{ $0.view }
    }
    
    public var tabBar: some View {
        
        HStack {
            Spacer()
            ForEach(0..<tabText.count) { index in
                VStack {
                    Image(systemName: self.tabIconNames[index] ?? "circle.badge.questionmark")
                        .resizable()
                        .frame(width: 24, height: 24)           .safeAreaPadding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    Text(self.tabText[index])
                }
                    
                .padding()
                .foregroundColor(self.selection == index ? Color.accentColor : Color.primary)
                .background(Color.tertiaryBackground)
                .onTapGesture {
                    self.selection = index
                }
            }
            Spacer()
        }
        .padding(0)
        .background(Color.tertiaryBackground) // Extra background layer to reset the shadow and stop it applying to every sub-view
        .shadow(color: Color.clear, radius: 0, x: 0, y: 0)
        .background(Color.tertiaryBackground)
        .shadow(
            color: Color.black.opacity(0.25),
            radius: 3,
            x: 0,
            y: tabBarPosition == .top ? 1 : -1
        )
        .zIndex(99) // Raised so that shadow is visible above view backgrounds
    }
    public var body: some View {
        
        VStack(spacing: 0) {
            
            if (self.tabBarPosition == .top) {
                tabBar
            }
            
            tabViews[selection]
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if (self.tabBarPosition == .bottom) {
                tabBar
            }
        }
        .padding(0)
    }
}

#Preview {
    CustomTabView(
                tabBarPosition: .top,
                content: [
                    (
                        tabText: "Tab 1",
                        tabIconName: "paintpalette",
                        view: AnyView(
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text("First Tab!")
                                    Spacer()
                                }
                                Spacer()
                            }
                            .background(Color.blue)
                        )
                    ),
                    (
                        tabText: "Tab 2",
                        tabIconName: nil,
                        view: AnyView(
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text("Second Tab!")
                                    Spacer()
                                }
                                Spacer()
                            }
                            .background(Color.red)
                        )
                    ),
                    (
                        tabText: "Tab 3",
                        tabIconName: "icons.general.cog",
                        view: AnyView(
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Text("Third Tab!")
                                    Spacer()
                                }
                                Spacer()
                            }
                            .background(Color.yellow)
                        )
                    )
                ]
            )
}
