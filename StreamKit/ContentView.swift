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
                    ManagerView()
                        .navigationTitle("ManagerKit")
                        .navigationSubtitle("Livestream configuration and management")
                } label: {
                    Label("HelperKit", systemImage: "squares.leading.rectangle" )
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
            Text("StreamKit v0.3-dev")
                .foregroundStyle(.secondary)
                .italic()
        }
        .navigationTitle("StreamKit")
    }
}

#Preview {
    ContentView()
}

// AppIcon: https://icon.kitchen/i/H4sIAAAAAAAAAzWPzQ6CMBCE32W9ElMUjXL14APIzXhY%2BkdjS7UFjCG8u9tGethkvszMbmeY0I4yQj2DwPBsOukk1AptlAUo3XxfJME41BIKaFegAwoj%2ByGz6yqohHvrQ0mOzbmsjkqRIaNdQkoxeoSw15ZqqsNCeRTUXcPEtvtUl%2BQlRVLixDjDjPWtw7w6vkcTOMULGNK14n8uVTkvRps%2Bc6cNIngjyGR8pPmRLU2HnNRj%2BQGYwnu89wAAAA%3D%3D
