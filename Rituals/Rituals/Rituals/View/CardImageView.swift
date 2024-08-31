//
//  CardImageView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct CardImageView: View {
    
    // MARK: - Properties
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    // MARK: - Body
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

