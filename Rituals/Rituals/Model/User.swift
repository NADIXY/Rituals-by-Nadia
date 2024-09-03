//
//  User.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    
    //Initialentyp erstellen
    var initials: String {
        let formatter = PersonNameComponentsFormatter() //Formatieren die Personen                       //PersonenNamen aus der Vollständigen Namen
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
