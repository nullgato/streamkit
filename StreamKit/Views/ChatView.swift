//
//  ChatView.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import SwiftUI
import OSLog
import WebKit

struct ChatView: View {
    @AppStorage(StorageKeys.twitchEnabled) private var twitchEnabled = false
    @AppStorage(StorageKeys.twitchUsername) private var twitchUsername = ""
    
    @AppStorage(StorageKeys.youtubeEnabled) private var youtubeEnabled = false
    @AppStorage(StorageKeys.youtubeUsername) private var youtubeUsername = ""
    
    @AppStorage(StorageKeys.streamlabsEnabled) private var streamlabsEnabled = false
    
    @State private var ytVideoID = ""
    @State private var showYTChat = false
    
    init() {
        Logger.viewCycle.debug("ChatView.init")
    }
    
    func refreshYTChat() {
        if youtubeEnabled && !youtubeUsername.isEmpty {
            LiveParser.requestLive(username: youtubeUsername) { identifier, error in
                guard let identifier = identifier, error == nil else {
                    print(error ?? "Unknown error")
                    return
                }
                
                ytVideoID = identifier
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                if youtubeEnabled {
                    VStack {
                        if !showYTChat {
                            TextField("YouTube Video ID", text: $ytVideoID, onCommit: { showYTChat.toggle() })
                            
                            Button("Refresh") {
                                Task {
                                    refreshYTChat()
                                }
                            }
                        }
                        
                        if showYTChat {
                            WebView("https://studio.youtube.com/live_chat?is_popout=1&v=\(ytVideoID)", isSafariAgent: true)
                        }
                    }
                }
                
                if twitchEnabled && !twitchUsername.isEmpty {
                    WebView("https://dashboard.twitch.tv/popout/u/\(twitchUsername)/stream-manager/chat?uuid=c3abe01d02c10990c356803dd4a21fc3")
                }
            }
            
            if streamlabsEnabled {
                WebView("https://streamlabs.com/dashboard/recent-events")
                    .frame(maxHeight: 300)
            }
        }
        .padding()
        .task {
            refreshYTChat()
        }
    }
}

#Preview {
    ChatView()
}
