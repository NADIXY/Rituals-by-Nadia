//
//  AboutMagicCardImageView.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import SwiftUI

struct AboutMagicCardImageView: View {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}

