//
//  AddUserRitualsView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct AddUserRitualsView: View {
    @StateObject var viewModel = AddUserRitualsViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Title", text: $viewModel.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
                    .padding([.leading, .trailing], 16)

                TextField("Description", text: $viewModel.text, axis: .vertical)
                    .padding()
                    .frame(height: 450) // Größeres Textfeld für Beschreibung
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
                    .padding([.leading, .trailing], 16)

                    Spacer()
                
                Button {
                    viewModel.addUserRituals()
                    isPresented.toggle()
                } label: {
                    Text("Save")
                }
            }
            .background(Color.clear.opacity(0.9))
            .navigationTitle("ADD A NEW RITUAL")
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
}

#Preview {
    AddUserRitualsView(isPresented: .constant(true))
}
