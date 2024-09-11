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
    @Published var title: String
    
    init(userRituals: UserRituals) {
        self.title = userRituals.title ?? ""
        self.text = userRituals.text
        self.userRituals = userRituals
    }

    func updateUserRituals() {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid, let userRitualsId = userRituals.id {
                    try await store.updateUserRituals(title: title, text: text, userId: uid, userRitualsId: userRitualsId)
                }
            }
        }
    }
}
