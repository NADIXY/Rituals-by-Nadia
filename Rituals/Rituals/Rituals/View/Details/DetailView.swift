//
//  DetailView.swift
//  Rituals
//
//  Created by Nadia on 01.09.24.
//

import SwiftUI

struct DetailView: View {
    let ritual: Rituals
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var showMaps = false
    
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
                                    .subtitle()
                                    .bold()
                                
                                Text("\(ritual.location)")
                                    .subtitle()
                            }
                            
                            Text(ritual.description)
                                .subtitle()
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("\(ritual.formattedPublishedDate)")
                                .lineLimit(1)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                            
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showMaps.toggle()
                                }) {
                                    Text("Search locations")
                                    Image(systemName: "magnifyingglass.circle.fill")
                                
                                }
                            }
                        }
                        .sheet(isPresented: $showMaps) {
                            MapSheetView(isPresented: $showMaps)
                        }
                        .padding(.horizontal, 30)
                    }
                    .navigationTitle("Rituals Details")
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
