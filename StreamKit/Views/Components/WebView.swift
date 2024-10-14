//
//  WebView.swift
//  StreamKit
//
//  Created by nullgato on 10/13/24.
//

import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    let isSafariAgent: Bool
    
    init(_ url: String, isSafariAgent: Bool = false) {
        self.url = URL(string: url)!
        self.isSafariAgent = isSafariAgent
    }
    
    func makeNSView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        if isSafariAgent {
            webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 14_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Safari/605.1.15"
        }
        
        webView.load(request)
    }
}

#Preview {
    WebView("https://apple.com")
}
