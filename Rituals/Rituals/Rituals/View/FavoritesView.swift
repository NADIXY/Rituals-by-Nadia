//
//  FavoritesView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI
import FirebaseFirestore

struct FavoritesView: View {
    
    // MARK: - Properties
    @FirestoreQuery(collectionPath: "rituals", predicates: [.isEqualTo("isFavorite", true)]) private var favoritesItems: [Rituals]
    var columns = Array(repeating: GridItem(), count: 2)
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favoritesItems) { item in
                    NavigationLink(destination: DetailView(ritual: item)) {
                        RitualsCardView(ritual: item)
                    }
                }
            }
        }
    
        .padding(.horizontal, 10)
        .background(.secondary.opacity(0.2))
        .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
            
        
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
}
