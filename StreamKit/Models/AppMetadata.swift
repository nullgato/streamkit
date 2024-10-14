//
//  AppMetadata.swift
//  StreamKit
//
//  Created by nullgato on 9/16/24.
//

import Foundation
import SwiftData
import AppKit

@Model
class AppMetadata {
    @Attribute(.unique) var name: String
    @Attribute(.unique) var process: String
    @Attribute(.unique) var path: String
    var args: [Argument] = []
    
    init(name: String, process: String, path: String, args: [Argument] = []) {
        self.name = name
        self.process = process
        self.path = path
        self.args = args
    }
}
