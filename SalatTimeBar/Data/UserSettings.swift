//
//  UserSettings.swift
//  SalatTimeBar
//
//  Created by Aamir Jawaid on 12/13/23.
//

import SwiftUI

public class UserSettings: ObservableObject {
    public static let shared = UserSettings()
    
    @AppStorage("address") var address: String = ""
    @AppStorage("isShort") var isShortFormat: Bool = false
}

@propertyWrapper
public struct UserSetting<T>: DynamicProperty {
    @ObservedObject var userSettings: UserSettings
    private let keyPath: ReferenceWritableKeyPath<UserSettings, T>
    public init(_ keyPath: ReferenceWritableKeyPath<UserSettings, T>, userSettings: UserSettings = .shared) {
        self.keyPath = keyPath
        self.userSettings = userSettings
    }

    public var wrappedValue: T {
        get { userSettings[keyPath: keyPath] }
        nonmutating set { userSettings[keyPath: keyPath] = newValue }
    }

    public var projectedValue: Binding<T> {
        Binding(
            get: { userSettings[keyPath: keyPath] },
            set: { value in
                userSettings[keyPath: keyPath] = value
            }
        )
    }
}
