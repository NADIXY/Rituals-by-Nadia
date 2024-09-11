//
//  MagicDetailView.swift
//  Rituals
//
//  Created by Nadia on 09.09.24.
//

import SwiftUI

struct AboutMagicDetailView: View {
    let magic: AboutMagic
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if let url = URL(string: magic.magicImage) {
                            AboutMagicCardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                                .ignoresSafeArea()
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text(magic.magicTitle)
                                    .titleFont()
                                    .foregroundColor(.yellow)
                            }
                            
                            Text(magic.magicDescription)
                                .subtitle()
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 30)
                    }
                    .navigationTitle("About Magic Details")
                }
            }
        }
    }
}
