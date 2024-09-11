//
//  AboutMagicView.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import SwiftUI
import FirebaseFirestore

struct AboutMagicView: View {
    @EnvironmentObject var magicvm: ViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @FirestoreQuery(collectionPath: "aboutMagic") var items: [AboutMagic]

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items) { item in
                    NavigationLink(destination: AboutMagicDetailView(magic: item)) {
                        AboutMagicCardView(magic: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("About Magic")
        .padding(.horizontal, 10)
        .background(Background())
        .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
        
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    AboutMagicView()
}
