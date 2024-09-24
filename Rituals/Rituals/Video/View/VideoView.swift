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
                        .frame(height: 250)
                    
                    Text("")
                }
            }
            .refreshable {
                Task {
                    try await videoVM.fetchVideos()
                }
            }
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
            .background(Background())
        }
    }
}

#Preview {
    VideoView()
}
