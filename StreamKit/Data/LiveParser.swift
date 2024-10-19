//
//  LiveParser.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import Foundation
import SwiftSoup

struct LiveParser {
    static func requestLive(completionHandler: @escaping (String?, Error?) -> Void) {
        do {
            let html = try String(contentsOf: URL(string: "https://youtube.com/@embyrdot/live")!, encoding: .utf8)
            
            let regex = /"videoId":"(.*?)"/
            if let result = try regex.firstMatch(in: html) {
                completionHandler(String(result.1), nil)
                return
            }
            
            completionHandler(nil, Exception.Error(type: .IOException, Message: "No match"))
        } catch {
            print("")
            completionHandler(nil, error)
        }
    }
}
