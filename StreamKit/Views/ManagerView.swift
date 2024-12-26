//
//  ManagerView.swift
//  StreamKit
//
//  Created by nullgato on 10/16/24.
//  Copyright © 2024 Bratcats Imperium. All rights reserved.
//

import SwiftUI

struct ManagerView: View {
    @AppStorage(StorageKeys.twitchEnabled) private var twitchEnabled = false
    @AppStorage(StorageKeys.twitchUsername) private var twitchUsername = ""
    
    @AppStorage(StorageKeys.youtubeEnabled) private var youtubeEnabled = false
    @AppStorage(StorageKeys.youtubeChannelId) private var youtubeChannelId = ""
    
    var body: some View {
        VStack {
            if twitchEnabled && !twitchUsername.isEmpty {
                WebView("https://dashboard.twitch.tv/popout/u/\(twitchUsername)/stream-manager/edit-stream-info?uuid=af5879f91a4317f4c3946962f5c9e8f5")
            }
            
            if youtubeEnabled && !youtubeChannelId.isEmpty {
                WebView("https://studio.youtube.com/channel/\(youtubeChannelId)/livestreaming/dashboard", isSafariAgent: true)
            }
        }
    }
}
