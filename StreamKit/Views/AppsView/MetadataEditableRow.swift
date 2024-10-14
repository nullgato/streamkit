//
//  MetadataRow.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI

struct MetadataEditableRow: View {
    let key: String
    let updateCallback: (String) -> Void
    @Binding var originalValue: String
    @State var value: String
    
    init(key: String, value: Binding<String>, updateCallback: @escaping (String) -> Void) {
        self.key = key
        _originalValue = value
        _value = .init(initialValue: value.wrappedValue)
        self.updateCallback = updateCallback
    }
    
    func onEditingChanged(editingChanged: Bool) {
        if editingChanged { return }
        if value.isEmpty || value == originalValue { return }
        
        updateCallback(value)
    }
    
    var body: some View {
        HStack {
            Text("\(key):")
                .fontWeight(.bold)
                .frame(width: 150, alignment: .trailing)
            
            TextField("", text: $value, onEditingChanged: onEditingChanged)
                .italic()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 5)
    }
}
