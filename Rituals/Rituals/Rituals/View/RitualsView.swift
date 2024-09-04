//
//  MainView.swift
//  Rituals
//
//  Created by Nadia on 29.08.24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestore

struct RitualsView: View {
    
    // MARK: - Propeties
    
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var fvvm: FavoritesViewModel
    
    @FirestoreQuery(collectionPath: "rituals") var items: [Rituals]
    var columns = Array(repeating: GridItem(), count: 1)
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(ritual: item)) {
                            RitualsCardView(ritual: item)
                                .environmentObject(fvvm)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.secondary.opacity(0.2))
            .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)

            // MARK: - Navigation Bar
            
            .navigationTitle("Rituals")
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView(fvvm: fvvm)) {
                        Image(systemName: "star.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: UserRitualsView()) {
                        Image(systemName: "newspaper")
                            .font(.title2)
                        Text("Your Rituals")
                    }
                }
            }
            
            .background {
                Image("Background")
                    .aspectRatio(contentMode: .fill)
            }
        }
    }
}

#Preview {
    RitualsView(fvvm: FavoritesViewModel())
        .environmentObject(ViewModel())
}
