//
//  AppsCreateView.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI
import OSLog

struct AppMetadataForm: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name = ""
    @State private var process = ""
    @State private var path = ""
    @State private var args: [Argument] = []
    
    init() {
        Logger.viewCycle.debug("MetadataCreateView.init")
    }
    
    func onCancel() { dismiss() }
    func onContinue() {
        modelContext.insert(AppMetadata(name: name, process: process, path: path, args: args))
        if (modelContext.hasChanges) {
            do {
                try modelContext.save()
                Logger.fileIO.info("MetadataCreateView.onContinue: \(name) saved")
            } catch {
                Logger.fileIO.error("MetadataCreateView.onContinue: \(name) failed: \(error)")
            }
        }
        
        dismiss()
    }
    
    var body: some View {
        VStack {
            AppCreateSheet(name: $name, process: $process, path: $path)
            
            Spacer().frame(height: 30)
            
            AppMetadataArguments(args: $args)
            
            Spacer().frame(height: 30)
            
            HStack {
                Button(action: onCancel, label: { Text("Cancel").frame(width: 60) })
                
                Spacer().frame(width: 20)
                
                Button(action: onContinue, label: {Text("Continue").frame(width: 60) })
                    .buttonStyle(.borderedProminent)
                    .disabled(name.isEmpty || process.isEmpty || path.isEmpty)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(maxWidth: 350)
        .padding()
    }
}

#Preview {
    AppMetadataForm()
}
