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
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Name", text: $viewModel.title)
                    .foregroundColor(.yellow)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.opacity(0.3))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 16)
                
                TextField("Description", text: $viewModel.text, axis: .vertical)
                    .padding()
                    .frame(height: 450) // Größeres Textfeld für Beschreibung
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 2))
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.background.opacity(0.3))
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 16)
                
                Spacer()
                
                Button {
                    viewModel.updateUserRituals()
                    isPresented.toggle()
                    dismiss()
                } label: {
                    Text("Update")
                    
                        .padding([.vertical], 16)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.background.opacity(0.3))
                        .cornerRadius(10)
                        .padding([.horizontal], 64)
                }
            }
            .background(Background())
            Spacer()
                
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: UserRituals(title: "", text: "")), isPresented: .constant(true))
}
