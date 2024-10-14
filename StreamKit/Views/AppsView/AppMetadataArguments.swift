//
//  ArgumentsList.swift
//  StreamKit
//
//  Created by nullgato on 10/11/24.
//

import SwiftUI

struct AppMetadataArguments: View {
    @Binding var args: [Argument]
    
    @State private var argsListSelection: String?
    @State private var alertArg = ""
    @State private var showAlert = false
    let alertTitle = "Add Argument"
    let alertMessage = "Input the argument flag to use for launching the application with, for example: --help"
    
    func onRemoveArg() {
        let index = args.firstIndex(of: Argument(argsListSelection!))
        if index == nil {
            print("Womp womp")
            return
        }
        
        args.remove(at: index!)
        argsListSelection = nil
    }
    
    func onAddArg() {
        args.append(Argument(alertArg))
        alertArg = ""
    }
    
    var body: some View {
        VStack {
            List(selection: $argsListSelection) {
                Section(header: Text("Arguments")) {
                    ForEach(args, id: \.value) { arg in
                        Text(arg.value)
                    }
                }
            }
            .listStyle(.bordered)
            .frame(height: 200)
            
            HStack {
                Button(action: { showAlert.toggle() }, label: { Image(systemName: "plus").imageScale(.large) })
                    .buttonStyle(.plain)
                    .alert(Text(alertTitle), isPresented: $showAlert, actions: {
                        TextField("--help", text: $alertArg)
                            .font(.title2)
                        
                        Button("Confirm", action: onAddArg).disabled(alertArg.isEmpty)
                        Button("Cancel", role: .cancel) {}
                    }, message: {
                        Text(alertMessage)
                    })
                
                Button(action: onRemoveArg, label: { Image(systemName: "minus").imageScale(.large) })
                    .buttonStyle(.plain)
                    .disabled((argsListSelection ?? "").isEmpty)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .bottom], 10)
            .padding(.top, 1)
        }
        .border(Color.gray, width: 1)
    }
}
