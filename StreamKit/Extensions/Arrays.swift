//
//  ArgumentArray.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import AppKit

extension [Argument] {
    func toStringArray() -> [String] {
        map(\.value)
    }
}

extension [NSRunningApplication] {
    func containsApp(_ name: String) -> Bool {
        for runningApp in self {
            if name == runningApp.localizedName ?? runningApp.className {
                return true
            }
        }
        
        return false
    }
}
