//
//  WebService.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import Foundation
import FirebaseStorage

class Repository {
    
    // MARK: - Users Api
    
    func fetchUsers() async throws -> [ApiUser] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            print("incorrect url")
            return []
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([ApiUser].self, from: data)
        return result
        
    }
    
    // MARK: - Video Upload

    static func uploadVideo(withData videoData: Data) async throws -> String? {
        
        let filename = NSUUID().uuidString // Identifizierungs Generator
        let ref = Storage.storage().reference().child("/videos/\(filename)")
        
        //Hier handelt sich um eine Videodatei
        let metadata = StorageMetadata()
        metadata.contentType = "video/quicktime"
        
        do {
            let _ = try await ref.putDataAsync(videoData, metadata: metadata )
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload video with error \(error.localizedDescription)")
            return nil
        }
        
    }
}
