//
//  AppsView.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import SwiftUI
import SwiftData
import Foundation
import AppKit
import OSLog
import Cocoa

struct AppsView: View {
    @Query(sort: [SortDescriptor(\AppMetadata.name)]) var apps: [AppMetadata]
    @Environment(\.modelContext) var context
    
    @State private var runningApps: [NSRunningApplication] = NSWorkspace.shared.runningApplications
    @State private var selectedApp: AppMetadata?
    @State private var showCreateSheet = false
    @State private var showEraseDialog = false
    @State private var showPathPicker = false
    
    init() {
        Logger.viewCycle.debug("AppsView.init")
    }
    
    var body: some View {
        EraseConfirmationDialog(isPresented: $showEraseDialog) {
            if selectedApp == nil { return }
            _ = AppMetadataProvider.deleteModel(with: selectedApp!, context: context)
            
            showEraseDialog.toggle()
        }
        
        PlistImporter(isPresented: $showPathPicker) { cfInfo in
            if selectedApp == nil {
                fatalError("AppsView: selectedApp is nil when it shouldn't be")
            }
            
            let oldPath = selectedApp!.path
            let oldProcess = selectedApp!.process
            selectedApp!.path = "\(cfInfo.url.relativePath)/Contents/MacOS/\(cfInfo.metadata.CFBundleExecutable)"
            selectedApp!.process = cfInfo.metadata.CFBundleExecutable
            Logger.fileIO.info("Updated app path - old: \(oldPath), new: \(selectedApp!.path)")
            Logger.fileIO.info("Updated app process - old: \(oldProcess), new: \(selectedApp!.process)")
            
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
        
        VStack {
            List(apps) { app in
                MetadataGroup(app, isRunning: runningApps.containsApp(app.process), selectedApp: $selectedApp, showEraseDialog: $showEraseDialog, showPathPicker: $showPathPicker)
            }
            .scrollContentBackground(.hidden)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .sheet(isPresented: $showCreateSheet) { AppMetadataForm() }
        .overlay(alignment: .bottomTrailing) {
            Button {
                showCreateSheet.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(.borderless)
            .padding(20)
        }
        .onAppear {
            Task { @MainActor in
                do {
                    while(true) {
                        try await Task.sleep(nanoseconds: UInt64(2 * Double(NSEC_PER_SEC)))
                        runningApps = NSWorkspace.shared.runningApplications
                    }
                } catch {
                }
            }
        }
    }
}

#Preview {    
    return AppsView()
        .modelContainer(AppsViewPreview.preivewContainer)
}

// FIXME: Fix bug with minimize/maximize groups w/ arguments
