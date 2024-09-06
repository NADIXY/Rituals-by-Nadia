//
//  LoginView.swift
//  Rituals
//
//  Created by Nadia on 26.08.24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        NavigationStack {
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
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in button
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
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
                
                Spacer()//abstandshalter
                
                //Wir wollen nur von einer Screen zu den andere navigieren
                NavigationLink {
                    
                    RegistrationView() //Das Ziel
                        .navigationBarBackButtonHidden(true)//Navigationsleiste ausgeblendet ist
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
            }
            
        }
        
    }
    
}

//Authentifizierungs Protocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 8
    }
}

#Preview {
    LoginView()    
}
