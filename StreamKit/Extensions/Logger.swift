//
//  Logger.swift
//  StreamKit
//
//  Created by nullgato on 9/17/24.
//

import OSLog

extension Logger {
    private static var subsystem =  Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
    static let fileIO = Logger(subsystem: subsystem, category: "fileio")
}
