//
//  ViewModel.swift
//  Rituals
//
//  Created by Nadia on 01.09.24.
//

import Foundation
import FirebaseFirestore

final class ViewModel: ObservableObject {
    
    // Mark: Properties
    private let db = Firestore.firestore().collection("rituals")
    
    // Mark: Methods
    func toggleFavorite(ritual: Rituals) {
        //guard let id = ritual.id else { return }
        //db.document(id).updateData(["isFavorite" : !ritual.isFavorite])
        updateItem(ritual, data: ["isFavorite" : !ritual.isFavorite])
    }
    
    private func updateItem(_ ritual: Rituals, data: [String : Any]) {
        guard let id = ritual.id else { return }
        db.document(id).updateData(data)
    }
}

