//
//  ApiUserListVM.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation

class ApiUserListVM: ObservableObject {
    @Published var users: [ApiUser] = []
    
    @MainActor
    func fetchAllUsers() {
        Task {
            do {
                self.users = try await Repository().fetchUsers()
            } catch {
                print(error.localizedDescription)
                
            }
        }
    }
}
