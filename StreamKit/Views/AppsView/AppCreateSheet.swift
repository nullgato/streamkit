//
//  MetadataForm.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI

struct AppCreateSheet: View {
    @Binding var name: String
    @Binding var process: String
    @Binding var path: String
    
    @State var showFilePicker = false
    
    var body: some View {
        PlistImporter(isPresented: $showFilePicker) { cfInfo in
            if name.isEmpty { name = cfInfo.metadata.CFBundleName ?? cfInfo.metadata.CFBundleDisplayName! }
            process = cfInfo.metadata.CFBundleExecutable
            path = cfInfo.url.relativePath + "/Contents/MacOS/\(process)"
        }
        
        Form {
            TextField("Application Name:", text: $name, prompt: Text("StreamKit"))
            
            Spacer().frame(height: 30)
            
            TextField("Process Name:", text: $process, prompt: Text("StreamKit"))
            
            Spacer().frame(height: 30)
            
            TextField("Application Path:", text: $path, prompt: Text("/Applications/StreamKit.app"))
                .disabled(true)
            
            Button(action: { showFilePicker.toggle() }, label: { Label("Choose", systemImage: "square.and.arrow.down") })
        }
    }
}
