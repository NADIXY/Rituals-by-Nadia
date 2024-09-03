//
//  FavoritesViewModel.swift
//  Rituals
//
//  Created by Nadia on 03.09.24.
//

import Foundation
import FirebaseAuth

@MainActor
class FavoritesViewModel: ObservableObject {
    @Published var favoriteRituals : [Rituals] = []

    private let store = FireStoreClient.shared
    
    func getFavoriteRituals() {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid {
                    favoriteRituals = try await store.getFavoriteRituals(userId: uid)
                }
                print("\(favoriteRituals)")
            } catch {
                print(error.localizedDescription)
                favoriteRituals = []
            }
        }
    }
    
    func isFavorite(fvRitualID: String) -> Bool {
        if favoriteRituals.contains(where: {$0.id == fvRitualID })
        { return true
            
        } else {
            return false
        }
            
    }

    func deleteFavoriteRituals(thisFavoriteRitualsId: String?) {
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

    func addFavoriteRituals(id: String, name: String,description: String, image: String, location: String) {
        do {
            if let uid = Auth.auth().currentUser?.uid {
                try store.addFavoriteRituals(id: id, name: name, userId: uid, description: description, image: image, location: location)
                getFavoriteRituals()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
