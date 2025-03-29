//
//  UserSettingsContentView.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/6/23.
//

import SwiftUI
import Sparkle

struct UserSettingsContentView: View {
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        CustomTabView(tabBarPosition: .top, 
                      content: [
            (
                tabText: "Location",
                tabIconName: "location",
                view: AnyView(
                    Form {
                        SettingLocationField(\.address)
                    }
                )
            ),
            (
                tabText: "Salat Settings",
                tabIconName: "gear",
                view: AnyView(
                    Form {
                        SettingSalatSchoolField(\.salatSchool)
                        SettingsNotifications(\.enableNotifications)
                        CheckForUpdatesView()
                    }
                )
            ),
            (
                tabText: "Look and Feel",
                tabIconName: "textformat.abc.dottedunderline",
                view: AnyView(
                    Form {
                        SettingFormatField(\.format)
                        SettingVisibleTimeField(\.visibleTime)
                    }
                )
            )]
        )
    }
}

struct SettingsNotifications: View {
    private let keyPath: ReferenceWritableKeyPath<UserSettings, Bool>
    @ObservedObject private var userSettings: UserSettings
    @ObservedObject private var appNotifications: AppNotifications
    
    @State var val: Bool
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, Bool>, userSettings: UserSettings = .shared, appNotifications: AppNotifications = .shared) {
        self.appNotifications = appNotifications
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        Section {
            Toggle(isOn: $val) {
                Text("Notifications")
            }.toggleStyle(.switch).onChange(of: val) {
                userSettings[keyPath: keyPath] = val
                if (val) {
                    appNotifications.requestAuth()
                }
            }
            LabeledContent("") {
                appNotifications.error == nil || !val ?
                Text("").fixedSize(horizontal: false, vertical: true).frame(width: 150)
                : Text(appNotifications.error ?? "").fixedSize(horizontal: false, vertical: true).frame(width: 150)
            }
        }
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
            HStack {
                TextField(
                    "Location",
                    text: $val,
                    prompt: Text("City or Location")
                ).textFieldStyle(.roundedBorder).onSubmit {
                    self.locationSearch.searchTerm = val
                }.submitLabel(.search)
                Button {
                    self.locationSearch.searchTerm = val
                } label: {
                    Text("Search")
                }
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
            }.listItemTint(.accentColor).frame(minHeight: 200)
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
            ForEach(Format.allCases) { format in
                Text(format.description)
            }
        }, label:  {
            Text("Format")
        }).pickerStyle(.inline).onChange(of: val) {
            userSettings[keyPath: keyPath] = val
        }
    }
}

struct SettingSalatSchoolField: View {
    private let keyPath: ReferenceWritableKeyPath<UserSettings, SalatSchool>
    @ObservedObject private var userSettings: UserSettings
    
    @State var val: SalatSchool
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, SalatSchool>, userSettings: UserSettings = .shared) {
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        Picker(selection: $val, content: {
            ForEach(SalatSchool.allCases) { format in
                Text(format.description)
            }
        }, label:  {
            Text("School")
        }).pickerStyle(.inline).onChange(of: val) {
            userSettings[keyPath: keyPath] = val
        }
    }
}

struct SettingVisibleTimeField: View {
    private let keyPath: ReferenceWritableKeyPath<UserSettings, VisibleTime>
    @ObservedObject private var userSettings: UserSettings
    
    @State var val: VisibleTime
    init(_ keyPath: ReferenceWritableKeyPath<UserSettings, VisibleTime>, userSettings: UserSettings = .shared) {
        self.keyPath = keyPath
        self.userSettings = userSettings
        self.val = userSettings[keyPath: keyPath]
    }
    
    var body: some View {
        Picker(selection: $val, content: {
            ForEach(VisibleTime.allCases) { format in
                Text(format.description)
            }
        }, label:  {
            Text("Time to show")
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

#Preview {
let mockAthanTimings = AthanTimings.shared
    
    return UserSettingsContentView()
        .environmentObject(mockAthanTimings)
}
