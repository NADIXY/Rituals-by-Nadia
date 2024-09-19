//
//  AuthViewModel.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//protocol ob das Formular gültig ist oder nicht
protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

//Diese classe hat 1 Protokoll die für beobachtbare Objekte entspricht.
//Sodass unsere Ansichten in der Lage sein werden, Änderungen an unserem Authentifizierungsansichtsmodell zu beobachten
@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        //Hier wird es versucht die Benutzer zu bholen
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)//Benutzerobjekt wurde kodiert, in Json-Daten kodieren, damit wir Sie auf Firebase hochladen.
            let encodedUser = try Firestore.Encoder().encode(user) //Benutzerobjekt die codiert worden ist und als nächstes in Firebase hochgeladen wird...
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //Diese Information wird auf Firebase hochgeladen, erstellung des Sammlungs, erstellung dieses Dokument mit der Benutzer-ID um nachverfolgen zu können um welche Benutzer_ID sich handelt
            await fetchUser()//Wenn die Vorgang abgeschlossen ist, warten auf Benutzerabruf
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
        
    //Benutzer auf Firebase abmelden und züruck auf Sign In Screen zurück geleitet werden
    func signOut() {
        do {
            try Auth.auth().signOut()
            //Löschen des Benutzersitzung und leitet Zurück zum Sign In Screen
            self.userSession = nil
            //Aktuelle Benutzer wird gelöscht
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount()async throws {
        do {
            try await userSession?.delete()
            //Löschen des Benutzersitzung und leitet Zurück zum Sign In Screen
            self.userSession = nil
            //Aktuelle Benutzer wird gelöscht
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return } //Uberprüfen wenn 1 akktuell angemeldeter Benutzer vorhanden ist, wird es abgerufen, wenn nicht, wird es genau dort angehalten
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)

        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
}
