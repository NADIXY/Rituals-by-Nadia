//
//  UpdateUserRitualsView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct UpdateUserRitualsView: View {
    @StateObject var viewModel: UpdateUserRitualsViewModel
    @Binding var isPresented: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            TextEditor(text: $viewModel.text)
            Button {
                viewModel.updateUserRituals()
                isPresented.toggle()
                dismiss()
            } label: {
                Text("UPDATE YOUR RITUALS")
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: UserRituals(text: "")), isPresented: .constant(true))
}
