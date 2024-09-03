//
//  RitualsCardView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct RitualsCardView: View {
    
    // MARK: Properties
    @EnvironmentObject var vm: FavoritesViewModel
    
    let ritual: Rituals
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: ritual.image) {
                        CardImageView(url: url, width: size.width, height: size.height)
                        
                        Button {
                            if vm.isFavorite(fvRitualID: ritual.id ?? "") {
                                vm.deleteFavoriteRituals(thisFavoriteRitualsId: ritual.id)
                            } else {
                                vm.addFavoriteRituals(id: ritual.id ?? "", name: ritual.name, description: ritual.description, image: ritual.image, location: ritual.location)
                            }
                        } label: {
                            Image(systemName: "star.fill")
                                .padding(10)
                                .foregroundColor(vm.isFavorite(fvRitualID: ritual.id ?? "") ? .yellow : .white)
                                .background(.blue)
                                .clipShape(Circle())
                                .padding()
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(ritual.name)
                        .titleFont()
                        .lineLimit(1)
                        //.foregroundColor(.yellow)
                    Text("Location: \(ritual.location)")
                        //.foregroundColor(.red)
                        .subtitle()
                }
                .padding(10)
                //.frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
            }
        }
        
        .frame(height: UIScreen.main.bounds.width * 0.7)
        //.background(.background.opacity(0.5))
        //.padding(10)
    }
}

#Preview {
    //RitualsView()
        //.environmentObject(ViewModel())
    
    RitualsCardView(
        ritual: Rituals(
            name: "Glücksbringer",
            description: "Verwandeln Sie einen Stein in einen Glücksbringer. Ein Stein des Strandes am besten klein, schließen sie in der Hand und wünschen, dass 1 bestimmte Person immer viel Glück und Schutz bekommt und verschenken sie es.",
            image: "https://firebasestorage.googleapis.com/v0/b/rituals-3bb39.appspot.com/o/Bildschirmfoto%202024-08-29%20um%2019.44.58.png?alt=media&token=3bf5c5a4-78cb-42c8-b259-18db795bbde5",
            location: "Ans Meer"
        )
    )
}
