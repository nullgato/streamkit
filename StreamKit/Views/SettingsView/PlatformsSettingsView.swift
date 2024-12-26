//
//  PlatformsSettingsView.swift
//  StreamKit
//
//  Created by nullgato on 12/26/24.
//  Copyright © 2024 Bratcats Imperium. All rights reserved.
//

//
//  SettingsView.swift
//  StreamKit
//
//  Created by nullgato on 12/26/24.
//  Copyright © 2024 Bratcats Imperium. All rights reserved.
//

import SwiftUI
import OSLog

struct PlatformsSettingsView: View {
    @AppStorage(StorageKeys.twitchEnabled) private var twitchEnabled = false
    @AppStorage(StorageKeys.twitchUsername) private var twitchUsername = ""
    
    @AppStorage(StorageKeys.youtubeEnabled) private var youtubeEnabled = false
    @AppStorage(StorageKeys.youtubeUsername) private var youtubeUsername = ""
    @AppStorage(StorageKeys.youtubeChannelId) private var youtubeChannelId = ""
    
    @AppStorage(StorageKeys.streamlabsEnabled) private var streamlabsEnabled = false
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Twitch:")
                        .frame(width: 100, alignment: .trailing)
                    Menu(twitchEnabled ? "Enabled" : "Disabled") {
                        Button("Disabled", action: {
                            twitchEnabled = false
                        })
                        
                        Button("Enabled", action: {
                            twitchEnabled = true
                        })
                    }
                }
                
                HStack {
                    Text("").frame(width: 100, alignment: .trailing)
                    TextField("Username", text: $twitchUsername)
                }
            }
            .padding()
            
            VStack {
                HStack {
                    Text("YouTube:")
                        .frame(width: 100, alignment: .trailing)
                    Menu(youtubeEnabled ? "Enabled" : "Disabled") {
                        Button("Disabled", action: {
                            youtubeEnabled = false
                        })
                        
                        Button("Enabled", action: {
                            youtubeEnabled = true
                        })
                    }
                }
                
                HStack {
                    Text("").frame(width: 100, alignment: .trailing)
                    TextField("Username", text: $youtubeUsername)
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    Text("").frame(width: 100, alignment: .trailing)
                    TextField("Channel ID", text: $youtubeChannelId)
                }
            }
            .padding()
            
            VStack {
                HStack {
                    Text("Streamlabs:")
                        .frame(width: 100, alignment: .trailing)
                    Menu(streamlabsEnabled ? "Enabled" : "Disabled") {
                        Button("Disabled", action: {
                            streamlabsEnabled = false
                        })
                        
                        Button("Enabled", action: {
                            streamlabsEnabled = true
                        })
                    }
                }
            }
            .padding()
        }
        .frame(width: 300)
    }
}

#Preview {
    PlatformsSettingsView()
}
