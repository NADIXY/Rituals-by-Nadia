//
//  DetailView.swift
//  Rituals
//
//  Created by Nadia on 01.09.24.
//

import SwiftUI

struct DetailView: View {
    
    let ritual: Rituals
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if let url = URL(string: ritual.image) {
                            CardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                                .ignoresSafeArea()
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text(ritual.name)
                                    .titleFont()
                                    .foregroundColor(.yellow)
                            }
                            
                            HStack {
                                Text("Location:")
                                    .foregroundColor(.blue)
                                    .subtitle()
                                Text("\(ritual.location)")
                                    .subtitle()
                            }
                            
                            Text(ritual.description)
                                .subtitle()
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                            
                        }
                        .padding(.horizontal, 30)
                    }
                    .navigationTitle("Rituals Details")
                    .background(.secondary.opacity(0.3))
                }
            }
        }
    }
}
            
#Preview {
    DetailView(
        ritual: Rituals(
        name: "Glücksbringer",
        description: "Verwandeln Sie einen Stein in einen Glücksbringer. Ein Stein des Strandes am besten klein, schließen sie in der Hand und wünschen, dass 1 bestimmte Person immer viel Glück und Schutz bekommt und verschenken sie es.",
        image: "https://firebasestorage.googleapis.com/v0/b/rituals-3bb39.appspot.com/o/Bildschirmfoto%202024-08-29%20um%2019.44.58.png?alt=media&token=3bf5c5a4-78cb-42c8-b259-18db795bbde5",
        location: "Ans Meer"))
}
