//
//  ManagerView.swift
//  StreamKit
//
//  Created by nullgato on 10/16/24.
//  Copyright © 2024 Bratcats Imperium. All rights reserved.
//

import SwiftUI

struct ManagerView: View {
    var body: some View {
        VStack {
            WebView("https://dashboard.twitch.tv/popout/u/nullmoggi/stream-manager/edit-stream-info?uuid=af5879f91a4317f4c3946962f5c9e8f5")
            WebView("https://studio.youtube.com/channel/UCUPtPvu6gzQZ4PlS4ZTIlvg/livestreaming/dashboard", isSafariAgent: true)
        }
    }
}
