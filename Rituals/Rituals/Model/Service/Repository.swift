//
//  WebService.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation

class Repository {
    
    func fetchUsers() async throws -> [ApiUser] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("incorrect url")
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([ApiUser].self, from: data)
        return result
        
    }
}
