//
//  AboutMagicViewModel.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import Foundation
import FirebaseFirestore

final class AboutMagicViewModel: ObservableObject {
    
    private let db = Firestore.firestore().collection("aboutMagic")
    
    private func updateItem(_ magic: AboutMagic, data: [String : Any]) {
        guard let id = magic.id else { return }
        db.document(id).updateData(data)
    }
    
}
