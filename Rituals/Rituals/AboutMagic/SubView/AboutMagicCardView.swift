//
//  AboutMagicCardView.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import SwiftUI

struct AboutMagicCardView: View {

    @EnvironmentObject var magicvm: ViewModel
    
    let magic: AboutMagic
    
    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
                    if let url = URL(string: magic.magicImage) {
                        AboutMagicCardImageView(url: url, width: size.width, height: size.height)
                    }
                }
                VStack(alignment: .leading) {
                    Text(magic.magicTitle)
                        .titleFont()
                        .lineLimit(1)
                    Text(magic.magicDescription)
                        .subtitle()
                }
                .padding(10)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
    }
}

