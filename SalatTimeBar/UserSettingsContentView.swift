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
            Spacer()
            Form {
                Section {
                    SettingFormatField(\.format)
                    SettingLocationField(\.address)
                }
            }
            Spacer()
        }.frame(width: 300)
            .padding(20)
    }
}

struct SettingLocationField: View {
    private let keyPath: ReferenceWritableKeyPath<UserSettings, String>
    @ObservedObject private var userSettings: UserSettings
    @StateObject private var locationSearch = LocationSearch()
    @State private var selection: Int?
    
    @State var val: String
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, String>, userSettings: UserSettings = .shared) {
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        VStack {
            TextField(
                "Location",
                text: $val
            ).onSubmit {
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
            }.listItemTint(.accentColor).frame(height: 150)
        }
    }
}

struct SettingFormatField: View {
    private let keyPath: ReferenceWritableKeyPath<UserSettings, Format>
    @ObservedObject private var userSettings: UserSettings
    
    @State var val: Format
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, Format>, userSettings: UserSettings = .shared) {
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        Picker(selection: $val, content: {
            ForEach(Format.allFormats) { format in
                Text(format.description)
            }
        }, label:  {
            Text("Format")
        }).pickerStyle(.inline).onChange(of: val) {
            userSettings[keyPath: keyPath] = val
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
