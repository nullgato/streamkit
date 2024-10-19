//
//  ContentView.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import SwiftUI
import OSLog

struct ContentView: View {
    @State private var selectedItem: ViewState? = .AppKit
    
    enum ViewState {
        case AppKit
        case HelperKit
        case ManagerKit
        case ChatKit
    }
    
    init() {
        Logger.viewCycle.debug("ContentView")
    }
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedItem) {
                NavigationLink(value: ViewState.AppKit) {
                    Label("AppKit", systemImage: "rectangle.on.rectangle")
                }
                
                NavigationLink(value: ViewState.HelperKit) {
                    Label("HelperKit", systemImage: "questionmark.circle")
                }
                
                NavigationLink(value: ViewState.ManagerKit) {
                    Label("ManagerKit", systemImage: "squares.leading.rectangle")
                }
                
                NavigationLink(value: ViewState.ChatKit) {
                    Label("ChatKit", systemImage: "ellipsis.message")
                }
            }
        } detail: {
            switch selectedItem {
            case .AppKit:
                AppsView()
                    .modelContainer(for: AppMetadata.self, inMemory: false)
                    .navigationTitle("AppKit")
                    .navigationSubtitle("Status management for streaming related applications")
                
            case .HelperKit:
                HelperView()
                    .navigationTitle("HelperKit")
                    .navigationSubtitle("Helper tools for StreamKit")
                
            case .ManagerKit:
                ManagerView()
                    .navigationTitle("ManagerKit")
                    .navigationSubtitle("Livestream configuration and management")
                
            case .ChatKit:
                ChatView()
                    .navigationTitle("ChatKit")
                    .navigationSubtitle("Chatting viewer and tools")
            default:
                Text("StreamKit v0.3.1-alpha")
            }
        }
        .navigationTitle("StreamKit")
    }
}

#Preview {
    ContentView()
}

// AppIcon: https://icon.kitchen/i/H4sIAAAAAAAAAz2PPw%2BCQAzFv0tdGUDRKKsxTk6yGYd61x6E448ckBjCd7d3Ebv19fde2xkmtCM5yGbQ2Fd5QTVBxmgdRcAm%2F3TSQlmjIYjgtQqmR11SMwTtujYSolrb9okQm1OSHpgFCNLWS8yxlEjYGCsx6X4RP2pDZ8945BirGHch9l5g2OXeY9kr4SMY%2FHn6f1%2BwCoG2K1DGbC7MpAZ5B8jShIM3sbmhq34mWVi3erT%2B5QfUqFoHz%2BULge%2BAvgcBAAA%3D
