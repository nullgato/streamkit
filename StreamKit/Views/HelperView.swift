//
//  HelperView.swift
//  StreamKit
//
//  Created by nullgato on 10/13/24.
//

import SwiftUI
import OSLog

struct HelperView: View {
    @Environment(\.openURL) private var openURL
    
    init() {
        Logger.viewCycle.debug("HelperView.init")
    }
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(HelperToolboxProvider.getHelperToolboxes(), id: \.title) { toolbox in
                ToolStack(toolbox.title) {
                    ForEach(toolbox.tools, id: \.title) { tool in
                        ToolButton(tool.title, image: tool.systemImage, url: tool.url, color: tool.color)
                    }
                }
            }
        }.padding()
    }
}

#Preview {
    HelperView()
}
