//
//  VideoView.swift
//  Rituals
//
//  Created by Nadia on 24.09.24.
//

import SwiftUI
import PhotosUI
import AVKit

struct VideoView: View {
    
    @StateObject var videoVM = VideoViewModel()
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                ForEach(videoVM.videos) { video in
                    VideoPlayer(player: AVPlayer(url: URL(string: video.videoUrl)!))
                        .frame(width: 350, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .refreshable {
                Task {
                    try await videoVM.fetchVideos()
                }
            }
            
            Button {
                Task {
                    try await videoVM.fetchVideos()
                }
            } label: {
                HStack {
                    Text("Refresh")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.clockwise")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Background())
            .cornerRadius(10)
            .padding(.top, 24)
            
            .navigationTitle("Community Videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Fotoauswahl und das ausgewählte Element
                    PhotosPicker(selection: $videoVM.selectedItem, matching: .any(of: [.videos, .not(.images)])) {
                        
                        Text("Add your Video")
                        
                        Image(systemName: "video.badge.plus")
                            .foregroundColor(.blue)
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    VideoView()
}
