//
//  SettingsView.swift
//  StreamKit
//
//  Created by nullgato on 12/26/24.
//  Copyright © 2024 Bratcats Imperium. All rights reserved.
//

import SwiftUI
import OSLog

struct SettingsView: View {
    @State private var twitchEnabled = false
    
    var body: some View {
        TabView {
            Tab("Platforms", systemImage: "tv") {
                PlatformsSettingsView()
            }
        }
        .scenePadding()
        .tabViewStyle(.tabBarOnly)
    }
}

#Preview {
    SettingsView()
}
