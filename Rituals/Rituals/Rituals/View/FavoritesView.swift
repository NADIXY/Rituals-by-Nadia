//
//  FavoritesView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI
import FirebaseFirestore

struct FavoritesView: View {
    @ObservedObject var fvvm : FavoritesViewModel

    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(fvvm.favoriteRituals) { item in
                    NavigationLink(destination: DetailView(ritual: item)) {
                        RitualsCardView(ritual: item)
                            .environmentObject(fvvm)
                    }
                }
            }
        }
        .onAppear {
            fvvm.getFavoriteRituals()
        }
        .padding(.horizontal, 10)
        .background(Background())
        .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
            
        .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView(fvvm: FavoritesViewModel())
}
