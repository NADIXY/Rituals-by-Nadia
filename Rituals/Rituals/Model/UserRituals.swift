//
//  UserRituals.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import Foundation
import FirebaseFirestore

struct UserRituals: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String?
    let text: String
    var finished: Bool = false
    var createdAt: Date = Date.now
    
    var formattedPublishedDate: String {
           let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: createdAt)
    }
}
