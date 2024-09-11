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
    
    //Initialentyp erstellen
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
