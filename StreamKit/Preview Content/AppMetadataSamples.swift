//
//  AppMetadataSamples.swift
//  StreamKit
//
//  Created by nullgato on 10/10/24.
//

import Foundation

extension AppMetadata {
    static var sampleApps: [AppMetadata] {
        [
            AppMetadata(name: "Orion", process: "Orion", path: "/Applications/Orion.app"),
            AppMetadata(name: "OBS Studio", process: "OBS Studio", path: "/Applications/OBS.app"),
            AppMetadata(name: "VTube Studio", process: "VTube Studio", path: "/Users/nullgato/Library/Application Support/Steam/steamapps/common/VTube Studio/VTubeStudio.app/Contents/MacOS/VTube Studio", args: [Argument("--args"), Argument("--nosteam")])
        ]
    }
}
