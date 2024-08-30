//
//  MainView.swift
//  Rituals
//
//  Created by Nadia on 29.08.24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestore

struct MainView: View {
    //Propeties
    @FirestoreQuery(collectionPath: "rituals") var items: [Rituals]
    var columns = Array(repeating: GridItem(), count: 2)
    
    //Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        RitualsCardView(ritual: item)
                    }
                }
            }
            
            //Navigation Bar
            .navigationTitle("Rituals")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView()) {
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
            }
        }
    }
}

#Preview {
    MainView()
}


/*
 @FirestoreQuery(collectionPath: "rituals") var items: [Rituals]

 var body: some View {
     List {
         ForEach(items) { item in
             HStack {
                 Text(item.name)
                 Text("\(item.description)")
             }
         }
     }
 }
}
 */

