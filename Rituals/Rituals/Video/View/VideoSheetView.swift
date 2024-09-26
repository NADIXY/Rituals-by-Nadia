//
//  VideoSheetView.swift
//  Rituals
//
//  Created by Nadia on 26.09.24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct VideoSheetView: View {
    @ObservedObject var videoVM: VideoViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Select Video")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            // Fotoauswahl und das ausgewählte Element
                            PhotosPicker(selection: $videoVM.selectedItem, matching: .any(of: [.videos, .not(.images)])) {

                                Text("Select your Video")
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                    }   
            }
            .onChange(of: videoVM.finishUploading) {
                isPresented = false
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Background())
            .navigationBarItems(leading: Button("Cancel") {
            isPresented = false
            })
        }
        
    }
}

