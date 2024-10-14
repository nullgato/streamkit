//
//  AppsListView.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI
import OSLog

struct MetadataGroup: View {
    @State private var app: AppMetadata
    @Binding var selectedApp: AppMetadata?
    @Binding var showEraseDialog: Bool
    @Binding var showPathPicker: Bool
    let isRunning: Bool
    
    init(_ app: AppMetadata, isRunning: Bool, selectedApp: Binding<AppMetadata?>, showEraseDialog: Binding<Bool>, showPathPicker: Binding<Bool>) {
        self.app = app
        _selectedApp = selectedApp
        _showEraseDialog = showEraseDialog
        _showPathPicker = showPathPicker
        self.isRunning = isRunning
    }
    
    func onDelete() {
        selectedApp = app
        showEraseDialog = true
    }
    
    func onAddArg() {
        app.args.append(.init("--arg"))
    }
    
    struct ArgumentSectionHeader: View {
        let onAdd: () -> Void
        let argsCount: Int
        
        var body: some View {
            HStack(alignment: .firstTextBaseline) {
                Text("Arguments (\(argsCount))")
                
                Button(action: onAdd) {
                    Image(systemName: "plus.circle.fill").imageScale(.large)
                }.buttonStyle(.plain)
            }
        }
    }
    
    var body: some View {
        DisclosureGroup {
            VStack {
                MetadataEditableRow(key: "Application Name", value: $app.name) { value in
                    app.name = value
                    Logger.fileIO.info("Updated app name - old: \(app.name), new: \(value)")
                }
                
                MetadataRow("Process Name", value: app.process)
                    .padding([.top, .bottom], 5)
                
                MetadataRow("Application Path", value: app.path)
                    .padding(.top, 5)
                    .pointerStyle(.link)
                    .onTapGesture {
                        selectedApp = app
                        showPathPicker.toggle()
                    }
                
                
                List {
                    Section(header: ArgumentSectionHeader(onAdd: onAddArg, argsCount: app.args.count)) {
                        ForEach(app.args, id: \.id) { arg in
                            MetadataArgumentRow(arg) { changedArg in
                                let index = app.args.firstIndex(where: { $0.id == arg.id })
                                if index == nil { return }
                                
                                if changedArg.value.isEmpty { app.args.remove(at: index!) }
                                else { app.args[index!] = changedArg }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .frame(minHeight: 100)
                .padding([.leading, .trailing], 30)
                .padding(.top, 10)
            }
            .padding(.bottom, 10)
        } label: {
            MetadataGroupLabel(app: app, isRunning: isRunning)
                .contextMenu { Button("Delete", action: onDelete) }
        }
    }
}
