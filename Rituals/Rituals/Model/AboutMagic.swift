//
//  AboutMagic.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import Foundation

import Foundation
import FirebaseFirestore

struct AboutMagic: Identifiable, Codable {
    @DocumentID var id: String?
    var magicTitle: String
    var magicDescription: String
    var magicImage: String
}
