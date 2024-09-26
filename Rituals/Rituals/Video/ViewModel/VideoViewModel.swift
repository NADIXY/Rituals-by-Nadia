//
//  VideoViewModel.swift
//  Rituals
//
//  Created by Nadia on 24.09.24.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore

class VideoViewModel: ObservableObject {
    @Published var videos = [Video]()
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { try await uploadVideo() } }
    }
    @Published var finishUploading = false
    
    init() {
        Task { try await fetchVideos() }
    }
    
    func uploadVideo() async throws {
        
        guard let item = selectedItem else {
            return
        }
        
        guard let videoData = try await item.loadTransferable(type: Data.self) else {
            return
        }
        
        guard let videoUrl = try await Repository.uploadVideo(withData: videoData) else {
            return
        }
        
        //Url in den Firestore hochladen, damit diese Informationen in den Firestore hochgeladen werden
        try await Firestore.firestore().collection("videos").document().setData(["videoUrl": videoUrl])
        print("Finished video upload...")
        finishUploading = true
    }
    
        @MainActor
        func fetchVideos() async throws {
            let snapshot = try await Firestore.firestore()
                .collection("videos")
                .getDocuments()
                                                               //damit die Daten übernohmen werden
            self.videos = snapshot.documents.compactMap({ try? $0.data(as: Video.self)})
            
            for doc in snapshot.documents {
                print(doc.data())
        }
    }
}
