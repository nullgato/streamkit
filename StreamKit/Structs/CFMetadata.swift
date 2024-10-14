//
//  AppInfoPlist.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import Foundation

struct CFMetadata: Decodable {
    let CFBundleExecutable: String
    let CFBundleName: String?
    let CFBundleDisplayName: String?
    
    static func from(_ path: String) -> CFMetadata? {
        let fileURL = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: fileURL)
            return try PropertyListDecoder().decode(CFMetadata.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
