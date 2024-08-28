//
//  RegistrationView.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    //Um sicherzustellen, dass unsere Navigation dadurch wieder auf den ursprünglichen Bildschirm zurückspringt, damit wir das tun können verwenden hier dazu diese praktische Umgebungseigenschaft:
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()//größe verändern
                .scaledToFill()//um ihn zu füllen
                .frame(width: 100, height: 120)// Rahmen mit einer Breite geben
                .padding(.vertical, 32)//Punkt abstand mit Pixel
            
            //Formularfeldabsschnitt
            VStack(spacing: 24) {
                InputView(text: $email,
                          title: "Email Address",
                          placeholder: "name@icloud.com")
                .autocapitalization(.none) //Automatische Großschreibung
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                
                InputView(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your Password",
                          isSecureField: true)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, pasword: password, fullname: fullname)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {//Damit wir zwischen unsere Ansichten hin- und her herwechseln können
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Alredy have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}


#Preview {
    RegistrationView()
}
