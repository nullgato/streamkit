//
//  ToolButton.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import SwiftUI

struct ToolButton: View {
    @Environment(\.openURL) private var openURL
    
    let title: String
    let image: String
    let url: URL
    let color: Color
    
    init(_ title: String, image: String, url: String, color: Color) {
        self.title = title
        self.image = image
        self.url = URL(string: url)!
        self.color = color
    }
    
    var body: some View {
        Button { openURL(url) } label: {
            HStack {
                Image(systemName: image).frame(width: 20, height: 20, alignment: .trailing)
                Text(title).frame(width: 110)
            }
                .frame(height: 25)
                .padding(.horizontal, 10)
        }
        .buttonStyle(.borderedProminent)
        .tint(color)
    }
}
