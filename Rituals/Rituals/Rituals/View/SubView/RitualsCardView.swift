//
//  RitualsCardView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct RitualsCardView: View {
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
                                vm.addFavoriteRituals(id: ritual.id ?? "", name: ritual.name, description: ritual.description, image: ritual.image, location: ritual.location, /***/createdAt: ritual.createdAt)
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
                        .foregroundColor(.yellow)
                    
                    Text("\(ritual.description)")
                        .subtitle()
                        .lineLimit(2)
                    
                    Text("\(ritual.createdAt)")
                        .lineLimit(1)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
            }
        }
        
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .padding(10)
    }
}
