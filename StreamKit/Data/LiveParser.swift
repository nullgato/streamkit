//
//  LiveParser.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import Foundation
import SwiftSoup

struct LiveParser2 {
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

class LiveParser: NSObject {
    var identifier: String?
    
    class func requestLive(completionHandler: @escaping (String?, Error?) -> Void) {
        let url = URL(string: "https://youtube.com/@embyrdot/live")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("error")
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            
            let delegate = LiveParser()
            let parser = XMLParser(data: data)
            parser.delegate = delegate
            parser.parse()
            DispatchQueue.main.async {
                completionHandler(delegate.identifier, parser.parserError)
            }
        }
        task.resume()
    }
}

extension LiveParser: XMLParserDelegate {
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print(elementName)
        switch elementName {
        case "meta":
            if attributeDict["itemprop"] == "identifier" {
                identifier = attributeDict["content"]
            }
        default: break
        }
    }
}
