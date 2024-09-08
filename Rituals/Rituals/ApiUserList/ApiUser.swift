//
//  User.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation

struct ApiUser: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
