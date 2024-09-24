//
//  Video.swift
//  Rituals
//
//  Created by Nadia on 24.09.24.
//

import Foundation

struct Video: Identifiable, Decodable {
    let videoUrl: String
     var id : String {
        return NSUUID().uuidString
    }
}
