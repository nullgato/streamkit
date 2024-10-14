//
//  ContentView.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import SwiftUI
import OSLog

struct ContentView: View {
    init() {
        Logger.viewCycle.debug("ContentView")
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    AppsView()
                        .modelContainer(for: AppMetadata.self, inMemory: false)
                        .navigationTitle("AppKit")
                        .navigationSubtitle("Status management for streaming related applications")
                } label: {
                    Label("AppKit", systemImage: "rectangle.on.rectangle")
                }
                
                NavigationLink {
                    HelperView()
                        .navigationTitle("HelperKit")
                        .navigationSubtitle("Helper tools for StreamKit")
                } label: {
                    Label("HelperKit", systemImage: "questionmark.circle" )
                }
                
                NavigationLink {
                    ChatView()
                        .navigationTitle("ChatKit")
                        .navigationSubtitle("Chatting viewer and tools")
                } label: {
                    Label("ChatKit", systemImage: "ellipsis.message" )
                }
            }
        } detail: {
            Text("StreamKit v0.1-dev")
                .foregroundStyle(.secondary)
                .italic()
        }
        .navigationTitle("StreamKit")
    }
}

#Preview {
    ContentView()
}
