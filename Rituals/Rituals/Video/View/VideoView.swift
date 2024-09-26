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
    
    @State private var showVideos = false
    
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
            .onChange(of: showVideos) {
                if showVideos == false {
                    Task {
                        try await videoVM.fetchVideos()
                    }
                }
            }
            
            .navigationTitle("Community Videos")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showVideos.toggle()
                    }) {
                        Text("Add your Video")
                        Image(systemName: "video.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $showVideos) {
                VideoSheetView(videoVM: VideoViewModel(), isPresented: $showVideos)
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Background())
    }
}

#Preview {
    VideoView()
}
