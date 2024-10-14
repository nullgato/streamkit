//
//  AppsViewPreview.swift
//  StreamKit
//
//  Created by nullgato on 10/10/24.
//

import Foundation
import SwiftData

@MainActor
class AppsViewPreview {
    static let preivewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: AppMetadata.self, configurations: config)
            
            AppMetadata.sampleApps.forEach { app in
                container.mainContext.insert(app)
            }
            
            return container
        }  catch {
            fatalError("Failed to create model container for previewing: \(error.localizedDescription)")
        }
    }()
}
