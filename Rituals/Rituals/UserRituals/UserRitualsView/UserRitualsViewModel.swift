//
//  UserRitualsViewModel.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseAuth

@MainActor
class UserRitualsViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var userRituals: [UserRituals] = []
    @Published var showSettings = false

    private let store = FireStoreClient.shared
    
    func getUserRituals() {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid {
                    userRituals = try await store.getUserRituals(userId: uid)
                }
                print("\(userRituals)")
            } catch {
                print(error.localizedDescription)
                userRituals = []
            }
        }
    }

    func deleteUserRituals(thisUserRitualsId: String?) {
        Task {
            do {
                if let uid = Auth.auth().currentUser?.uid, let userRitualsId = thisUserRitualsId {
                    try await store.deleteUserRituals(userRitualsId: userRitualsId,
                                               userId: uid)
                    userRituals.removeAll(where: { $0.id == userRitualsId })
                }
            }
        }
    }
}
