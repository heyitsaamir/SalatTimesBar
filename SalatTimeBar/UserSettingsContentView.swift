//
//  UserSettingsContentView.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/6/23.
//

import SwiftUI

struct UserSettingsContentView: View {
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        HStack {
            Form {
                Section {
                    SettingToggleField(\.isShortFormat, label: "Short Form")
                    SettingLocationField(\.address, label: "Address", description: "Your address")
                }
            }
        }.frame(width: 300)
            .padding(20)
    }
}

struct SettingLocationField: View {
    let label: String
    let description: String
    private let keyPath: ReferenceWritableKeyPath<UserSettings, String>
    @ObservedObject private var userSettings: UserSettings
    @StateObject private var locationSearch = LocationSearch()
    @State private var isPopoverVisible: Bool
    @State private var selection: Int?
    
    @State var val: String
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, String>, label: String, description: String, userSettings: UserSettings = .shared) {
        self.label = label
        self.description = description
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
        self.isPopoverVisible = false
    }
    
    var body: some View {
        VStack {
            TextField(
                self.label,
                    text: $val
            ).onSubmit {
                self.isPopoverVisible = true
                self.locationSearch.searchTerm = val
            }
            
            List(locationSearch.locationResults, id: \.hashValue, selection: $selection) { location in
                Text(location.title)
            }.onChange(of: selection) {
                guard let newValue = locationSearch.locationResults.first(where: { location in
                    location.hashValue == selection
                }) else {
                    return
                }
                userSettings[keyPath: keyPath] = newValue.title
                val = newValue.title
            }.listItemTint(.accentColor).frame(height: 300)
        }
    }
}

struct SettingToggleField: View {
    let label: String
    private let keyPath: ReferenceWritableKeyPath<UserSettings, Bool>
    @ObservedObject private var userSettings: UserSettings
    
    @State var val: Bool
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, Bool>, label: String, userSettings: UserSettings = .shared) {
        self.label = label
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        VStack {
            Toggle(
                self.label,
                    isOn: $val
                )
            .onChange(of: val) {
                userSettings[keyPath: keyPath] = val
            }
            
        }
    }
}
