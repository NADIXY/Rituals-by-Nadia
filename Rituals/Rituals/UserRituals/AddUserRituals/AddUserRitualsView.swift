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
        VStack(spacing: 20) {
            TextEditor(text: $viewModel.text)
            Button {
                viewModel.addUserRituals()
                isPresented.toggle()
            } label: {
                Text("ADD YOUR RITUALS")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    AddUserRitualsView(isPresented: .constant(true))
}
