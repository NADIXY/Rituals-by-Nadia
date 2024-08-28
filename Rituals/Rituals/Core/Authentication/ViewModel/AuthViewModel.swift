//
//  AuthViewModel.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import Foundation
import Firebase
import FirebaseAuth

//Diese classe hat 1 Protokoll die für beobachtbare Objekte entspricht.
//Sodass unsere Ansichten in der Lage sein werden, Änderungen an unserem Authentifizierungsansichtsmodell zu beobachten

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("Sign in...")
        
    }
    
    func createUser(withEmail email:String, pasword: String, fullname: String) async throws {
        print("Create user")
        
    }
    
    func signOut() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        
    }
    
    
}
