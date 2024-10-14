//
//  MetadataGroupLabel.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI

struct MetadataGroupLabel: View {
    @Environment(\.modelContext) var context
    
    let app: AppMetadata
    let isRunning: Bool
    
    func openApp() {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: app.path)
        process.standardOutput = nil
        process.standardError = nil
        process.standardInput = nil
        
        if app.args.isEmpty {
            process.arguments = app.args.toStringArray()
        }
        
        try! process.run()
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: "circle.fill")
                .imageScale(.large)
                .foregroundStyle(isRunning ? .green : .red)
            
            Text("\(app.name)")
                .font(.headline)
            
            Button(action: openApp, label: { Image(systemName: "arrowshape.turn.up.right.circle.fill") })
                .buttonStyle(.plain)
        }
        .padding(5)
        .offset(x: 5)
    }
}
