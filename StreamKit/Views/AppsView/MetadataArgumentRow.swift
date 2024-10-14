//
//  MetadataArgumentRow.swift
//  StreamKit
//
//  Created by nullgato on 10/13/24.
//

import SwiftUI

struct MetadataArgumentRow: View {
    @State private var arg: Argument
    @State private var initialValue: String
    let onChange: (Argument) -> Void
    
    init (_ arg: Argument, onChange: @escaping (Argument) -> Void) {
        print(arg)
        _arg = .init(initialValue: arg)
        _initialValue = .init(initialValue: arg.value)
        self.onChange = onChange
    }
    
    var body: some View {
        TextField("", text: $arg.value, onCommit: {
            if arg.value != initialValue { onChange(arg) }
        })
    }
}
