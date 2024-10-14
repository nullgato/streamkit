//
//  Argument.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import Foundation

struct Argument: Codable, Equatable, Hashable {
    var id: UUID = .init()
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    static func == (lhs: Argument, rhs: Argument) -> Bool {
        lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
