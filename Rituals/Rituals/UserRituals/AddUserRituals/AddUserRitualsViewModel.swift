//
//  AddUserRitualsViewModel.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseAuth

class AddUserRitualsViewModel: ObservableObject {
    @Published var text = ""
    @Published var title = ""

    private let store = FireStoreClient.shared

    func addUserRituals() {
        do {
            if let uid = Auth.auth().currentUser?.uid {
                try store.addUserRituals(title: title, text: text, userId: uid)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
