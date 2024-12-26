//
//  LiveParser.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import Foundation
import SwiftSoup

struct LiveParser {
    static func requestLive(username: String, completionHandler: @escaping (String?, Error?) -> Void) {
        let url = URL(string: "https://youtube.com/@\(username)/live")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let unwrappedData = data
            else {
                completionHandler(nil, Exception.Error(type: .IOException, Message: "Couldn't load data"))
                return
            }
            
            let html = String(data: unwrappedData, encoding: .utf8)!
            
            let regex = /"videoId":"(.*?)"/
            do {
                if let result = try regex.firstMatch(in: html) {
                    completionHandler(String(result.1), nil)
                    return
                }
                
                completionHandler(nil, Exception.Error(type: .IOException, Message: "No match"))
            }
            catch {
                print("")
                completionHandler(nil, error)
            }
        }
    }
}
