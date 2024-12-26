//
//  HelperToolboxProvider.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import SwiftUI

struct HelperToolboxProvider {
    static func getHelperToolboxes(
    ) -> [HelperToolbox] {
        var helperToolboxes: [HelperToolbox] = []
        @AppStorage(StorageKeys.twitchEnabled) var twitchEnabled = false
        @AppStorage(StorageKeys.twitchUsername) var twitchUsername = ""
        
        @AppStorage(StorageKeys.youtubeEnabled) var youtubeEnabled = false
        @AppStorage(StorageKeys.youtubeChannelId) var youtubeChannelId = ""
        
        @AppStorage(StorageKeys.streamlabsEnabled) var streamlabsEnabled = false
        
        if twitchEnabled && !twitchUsername.isEmpty {
            helperToolboxes.append(
                HelperToolbox(title: "Twitch Tools", tools: [
                    HelperTool(title: "Twitch Manager", systemImage: "squares.leading.rectangle.fill", url: "https://dashboard.twitch.tv/u/\(twitchUsername)/stream-manager", color: .twitchPurple),
                    HelperTool(title: "Twitch Analytics", systemImage: "chart.bar.xaxis.ascending", url: "https://dashboard.twitch.tv/u/\(twitchUsername)/analytics", color: .twitchPurple),
                    HelperTool(title: "Twitch Content", systemImage: "movieclapper.fill", url: "https://dashboard.twitch.tv/u/\(twitchUsername)/content/video-producer", color: .twitchPurple)
                ])
            )
        }
        
        if youtubeEnabled && !youtubeChannelId.isEmpty {
            helperToolboxes.append(
                HelperToolbox(title: "YouTube Tools", tools: [
                    HelperTool(title: "YouTube Studio", systemImage: "tv.fill", url: "https://studio.youtube.com", color: .youTubeRed),
                    HelperTool(title: "YouTube Live", systemImage: "video.fill.badge.checkmark", url: "https://studio.youtube.com/channel/\(youtubeChannelId)/livestreaming/dashboard", color: .youTubeRed),
                    HelperTool(title: "YouTube Content", systemImage: "movieclapper.fill", url: "https://studio.youtube.com/channel/\(youtubeChannelId)/videos/live", color: .youTubeRed)
                ])
            )
        }
        
        if streamlabsEnabled {
            helperToolboxes.append(
                HelperToolbox(title: "Streamlabs Tools", tools: [
                    HelperTool(title: "Recent Events", systemImage: "list.bullet.rectangle.fill", url: "https://streamlabs.com/dashboard/recent-events", color: .slobsGreen),
                ])
            )
        }
        
        return helperToolboxes
    }
}
