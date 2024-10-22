//
//  HelperToolboxProvider.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

struct HelperToolboxProvider {
    static func getHelperToolboxes() -> [HelperToolbox] {
        [
            HelperToolbox(title: "YouTube Tools", tools: [
                HelperTool(title: "YouTube Studio", systemImage: "tv.fill", url: "https://studio.youtube.com", color: .youTubeRed),
                HelperTool(title: "YouTube Live", systemImage: "video.fill.badge.checkmark", url: "https://studio.youtube.com/channel/UCUPtPvu6gzQZ4PlS4ZTIlvg/livestreaming/dashboard", color: .youTubeRed),
                HelperTool(title: "YouTube Content", systemImage: "movieclapper.fill", url: "https://studio.youtube.com/channel/UCUPtPvu6gzQZ4PlS4ZTIlvg/videos/live", color: .youTubeRed)
            ]),
            HelperToolbox(title: "Twitch Tools", tools: [
                HelperTool(title: "Twitch Manager", systemImage: "squares.leading.rectangle.fill", url: "https://dashboard.twitch.tv/u/nullmoggi/stream-manager", color: .twitchPurple),
                HelperTool(title: "Twitch Analytics", systemImage: "chart.bar.xaxis.ascending", url: "https://dashboard.twitch.tv/u/nullmoggi/analytics", color: .twitchPurple),
                HelperTool(title: "Twitch Content", systemImage: "movieclapper.fill", url: "https://dashboard.twitch.tv/u/nullmoggi/content/video-producer", color: .twitchPurple)
            ]),
            HelperToolbox(title: "Streamlabs Tools", tools: [
                HelperTool(title: "Recent Events", systemImage: "list.bullet.rectangle.fill", url: "https://streamlabs.com/dashboard/recent-events", color: .slobsGreen),
            ])
        ]
    }
}
