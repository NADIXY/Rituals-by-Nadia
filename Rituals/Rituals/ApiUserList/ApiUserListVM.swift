//
//  ApiUserListVM.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation

class ApiUserListVM: ObservableObject {
    
    @Published var users: [ApiUser] = []
    
    func fetchAllUsers() {
        
        WebService().fetchUsers { result in
            switch result {
            case .success(let users):
                self.users = users
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}
