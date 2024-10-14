//
//  ErasureDialog.swift
//  StreamKit
//
//  Created by nullgato on 10/12/24.
//

import SwiftUI

struct EraseConfirmationDialog: View {
    @Binding var isPresented: Bool
    let onErase: () -> Void
    
    init(isPresented: Binding<Bool>, onErase: @escaping () -> Void) {
        _isPresented = isPresented
        self.onErase = onErase
    }
    
    var body: some View {
        ZStack { }
            .confirmationDialog("Erase entry?", isPresented: $isPresented) {
                Button("Erase", role: .destructive, action: onErase)
                    .keyboardShortcut(.defaultAction)
                    .tint(.red)
                
                Button("Cancel", role: .cancel) { isPresented.toggle() }
            } message: { Text("This action is irreversible") }
    }
}
