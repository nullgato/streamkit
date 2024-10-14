//
//  ToolStack.swift
//  StreamKit
//
//  Created by nullgato on 10/14/24.
//

import SwiftUI

struct ToolStack<Content: View>: View {
    let title: String
    let content: () -> Content
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    var body: some View {
        VStack {
            Text(title)
            content()
        }
    }
}
