//
//  CardImageView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct CardImageView: View {
    //Properties
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    //Body
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}

