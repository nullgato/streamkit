//
//  StreamKitApp.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import SwiftUI

@main
struct StreamKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        Settings {
            SettingsView()
                .frame(width: 500, height: 300)
        }
    }
}
