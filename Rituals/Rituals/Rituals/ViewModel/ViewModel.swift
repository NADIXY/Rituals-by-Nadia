//
//  ViewModel.swift
//  Rituals
//
//  Created by Nadia on 01.09.24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class ViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var favoriteRituals: [Rituals] = []
    
    private let db = Firestore.firestore().collection("rituals")
    private let store = FireStoreClient.shared
    
    private func updateItem(_ ritual: Rituals, data: [String : Any]) {
        guard let id = ritual.id else { return }
        db.document(id).updateData(data)
    }
    
    func getFavoriteRituals() {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid {
                    favoriteRituals = try await store.getFavoriteRituals(userId: uid)
                }
            } catch {
                print(error.localizedDescription)
                favoriteRituals = []
            }
        }
    }
    /***/
    
    func addFavoriteRituals(ritual: Rituals) {
        do {
            if let uid = Auth.auth().currentUser?.uid {
                try store.addFavoriteRituals(id: ritual.id ?? "", name: ritual.name, userId: uid, description: ritual.description, image: ritual.image, location: ritual.location, createdAt: ritual.createdAt)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteFavoriteRituals(thisFavoriteRitualsId: String? ) {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid, let favoriteRitualsId = thisFavoriteRitualsId {
                    try await store.deleteFavoriteRituals(favoriteRitualsId: favoriteRitualsId,
                                                          userId: uid)
                    favoriteRituals.removeAll(where: { $0.id == favoriteRitualsId })
                }
            }
        }
    }
}
