//
//  Rituals.swift
//  Rituals
//
//  Created by Nadia on 29.08.24.
//

import Foundation
import FirebaseFirestore

struct Rituals: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var location: String
    var createdAt: Date = Date.now
}
