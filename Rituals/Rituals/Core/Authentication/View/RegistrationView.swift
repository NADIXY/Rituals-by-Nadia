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
                .frame(width: 250, height: 250)// Rahmen mit einer Breite geben
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
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your Password",
                              isSecureField: true)
                    
                    //Passwörter stimmen überein?
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword { // Ob Passworter gleich sind
                            Image(systemName: "checkmark.circle.fill") //'check' Häkchen anzeige
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill") // 'x' anzeige
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed))
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
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
            .disabled(!formIsValid)//Ob es gültig ist
            .opacity(formIsValid ? 1.0 : 0.5)//Gültigkeit angezeige
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
        .background(BackgroundView())
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 8
        
        && confirmPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
