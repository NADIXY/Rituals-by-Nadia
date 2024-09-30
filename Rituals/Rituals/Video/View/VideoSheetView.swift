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
                Image("logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .cornerRadius(.maximum(20, 20))
                    .padding(.vertical, 32)
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Share your Rituals")
                        .font(.title)
                        .bold()
                    
                    Text("Your step-by-step instructions for performing Rituals")
                }
                
                Spacer()
                
                    .toolbar {
                        ToolbarItem(placement: .status) {
                            // Fotoauswahl und das ausgewählte Element
                            PhotosPicker(selection: $videoVM.selectedItem, matching: .any(of: [.videos, .not(.images)])) {

                                Text("Select your Video")
                                Image(systemName: "video.badge.plus")
                                    .foregroundColor(.blue)
                            }
                            .padding([.vertical], 16)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.background.opacity(0.3))
                            .cornerRadius(10)
                            .padding([.horizontal], 64)
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

