//
//  MetadataRow.swift
//  StreamKit
//
//  Created by nullgato on 10/13/24.
//

import SwiftUI

struct MetadataRow: View {
    let key: String
    let value: String
    
    init(_ key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    var body: some View {
        HStack {
            Text("\(key):")
                .fontWeight(.bold)
                .frame(width: 150, alignment: .trailing)
            
            Text(value)
                .italic()
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
