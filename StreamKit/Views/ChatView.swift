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
    @State private var ytVideoID = ""
    @State private var showYTChat = false
    
    init() {
        Logger.viewCycle.debug("ChatView.init")
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    if !showYTChat {
                        TextField("YouTube Video ID", text: $ytVideoID, onCommit: { showYTChat.toggle() })
                    }
                    
                    if showYTChat {
                        WebView("https://studio.youtube.com/live_chat?is_popout=1&v=\(ytVideoID)", isSafariAgent: true)
                    }
                }
                WebView("https://dashboard.twitch.tv/popout/u/transcendingember/stream-manager/chat?uuid=c3abe01d02c10990c356803dd4a21fc3")
            }
            
            WebView("https://streamlabs.com/dashboard/recent-events")
                .frame(maxHeight: 300)
        }
        .padding()
        .task {
            LiveParser.requestLive { identifier, error in
                guard let identifier = identifier, error == nil else {
                    print(error ?? "Unknown error")
                    return
                }
                
                ytVideoID = identifier
                showYTChat = true
            }
        }
    }
}

#Preview {
    ChatView()
}
