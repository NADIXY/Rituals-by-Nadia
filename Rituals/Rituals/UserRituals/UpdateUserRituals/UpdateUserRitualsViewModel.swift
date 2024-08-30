//
//  UpdateUserRitualsViewModel.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseAuth

class UpdateUserRitualsViewModel: ObservableObject {

    private let store = FireStoreClient.shared
    
    private let userRituals: UserRituals
    @Published var text: String
    
    
    init(userRituals: UserRituals) {
        self.text = userRituals.text
        self.userRituals = userRituals
    }

    func updateUserRituals() {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid, let userRitualsId = userRituals.id {
                    try await store.updateUserRituals(text: text, userId: uid, userRitualsId: userRitualsId)
                }
            }
        }
    }
}
