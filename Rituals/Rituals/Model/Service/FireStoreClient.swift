//
//  FireStoreClient.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseFirestore

class FireStoreClient {
    static let shared = FireStoreClient()
    private let store = Firestore.firestore()
    
    // MARK: - FavoriteRituals
    
    func getFavoriteRituals(userId: String) async throws -> [Rituals] {
        try await store
            .collection("users")
            .document(userId)
            .collection("favoriteRituals")
            .getDocuments()
            .documents
            .map { try $0.data(as: Rituals.self) }
    }
    
    func addFavoriteRituals(id: String, name: String, userId: String, description: String, image: String, location: String) throws {
        let favoriteRituals = Rituals(id: id, name: name, description: description,
                                      image: image,
                                      location: location)
        try store
            .collection("users")
            .document(userId)
            .collection("favoriteRituals")
            .document(id)
            .setData(from: favoriteRituals)
    }
    
    func deleteFavoriteRituals(favoriteRitualsId: String, userId: String) async throws {
        try await store
            .collection("users")
            .document(userId)
            .collection("favoriteRituals")
            .document(favoriteRitualsId)
            .delete()
    }
    
    // MARK: - UserRituals
    
    func getUserRituals(userId: String) async throws -> [UserRituals] {
        try await store
            .collection("users")
            .document(userId)
            .collection("userRituals")
            .getDocuments()
            .documents
            .map { try $0.data(as: UserRituals.self) }
    }
        
    func addUserRituals(title: String, text: String, userId: String) throws {
        let userRituals = UserRituals(title: title, text: text)
        try store
            .collection("users")
            .document(userId)
            .collection("userRituals")
            .addDocument(from: userRituals)
    }
    
    func updateUserRituals(title: String, text: String, userId: String, userRitualsId: String) async throws {
        try await store
            .collection("users")
            .document(userId)
            .collection("userRituals")
            .document(userRitualsId)
            .updateData([ /// .setDate(userRituals)
                "text": text,
                "finished": true
            ])
    }
    
    func deleteUserRituals(userRitualsId: String, userId: String) async throws {
        try await store
            .collection("users")
            .document(userId)
            .collection("userRituals")
            .document(userRitualsId)
            .delete()
    }
}
