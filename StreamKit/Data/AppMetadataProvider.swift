//
//  AppMetadataProvider.swift
//  StreamKit
//
//  Created by nullgato on 10/12/24.
//

import SwiftData
import OSLog

struct AppMetadataProvider {
    static func deleteModel(with model: AppMetadata, context: ModelContext) -> Bool {
        context.delete(model)
        
        if context.hasChanges {
            do {
                try context.save()
                Logger.fileIO.info("AppMetadataProvider.deleteModel: \(model.name) deleted")
            } catch {
                Logger.fileIO.error("AppMetadataProvider.deleteModel: \(model.name) failed: \(error)")
                return false
            }
        }
        
        return true
    }
}
