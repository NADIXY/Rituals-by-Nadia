//
//  WebService.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation

enum APIError: Error {
    case noData
    case apiFailed
    case parsingFailed
    case badUrl
}

class WebService {
    
    func fetchUsers(completionHandler: @escaping (Result< [ApiUser], APIError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            completionHandler(.failure(APIError.badUrl))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(.failure(APIError.apiFailed))
                return
            }
            
            do {
                
                let users = try JSONDecoder().decode([ApiUser].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(users))
                }
            } catch(let error) {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
