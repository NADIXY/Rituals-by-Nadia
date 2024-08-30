//
//  FileFireStoreClient.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseFirestore

class FireStoreClient {
    
    static let shared = FireStoreClient()
    
    private let store = Firestore.firestore()
    
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
    
    func addUserRituals(text: String, userId: String) throws {
        let userRituals = UserRituals(text: text)
        try store
            .collection("users")
            .document(userId)
            .collection("userRituals")
            .addDocument(from: userRituals)
    }
    
    func updateUserRituals(text: String, userId: String, userRitualsId: String) async throws {
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

