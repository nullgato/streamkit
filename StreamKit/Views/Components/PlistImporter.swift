//
//  FileImporter.swift
//  StreamKit
//
//  Created by nullgato on 10/12/24.
//

import SwiftUI
import OSLog

struct PlistImporter: View {
    @Binding var isPresented: Bool
    let onSuccess: (CFInfo) -> Void
    
    var body: some View {
        ZStack { }
            .fileImporter(isPresented: $isPresented, allowedContentTypes: [.application]) { result in
                if case .success(let url) = result {
                    let plistPath = url.relativePath + "/Contents/Info.plist"
                    let metadata = CFMetadata.from(plistPath)
                    
                    if (metadata == nil) {
                        Logger.fileIO.error("Plist file either could not be read or is formatted incorrectly")
                        fatalError("Plist file either could not be read or is formatted incorrectly")
                    }
                    
                    onSuccess(CFInfo(metadata: metadata!, url: url))
                }
                if case .failure(let failure) = result {
                    Logger.fileIO.error("PlistImporter: Failed to import plist: \(failure)")
                }
            }
    }
}
