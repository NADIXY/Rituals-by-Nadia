//
//  MainView.swift
//  Rituals
//
//  Created by Nadia on 29.08.24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestore

struct RitualsView: View {
    
    // MARK: - Propeties
    
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var fvvm: FavoritesViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @FirestoreQuery(collectionPath: "rituals") var items: [Rituals]
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Welcome, \(authViewModel.currentUser?.fullname ?? "")")
                    .font(.title2)
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("Recommended Rituals")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                                                
                ForEach(items) { item in
                    NavigationLink(destination: DetailView(ritual: item)) {
                        RitualsCardView(ritual: item)
                            .environmentObject(fvvm)
                    }
                    .buttonStyle(.plain)
                }
                
            }

            .padding(.horizontal, 10)
            .background(BackgroundView())
            .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)

            // MARK: - Navigation Bar
            
            .navigationTitle("Rituals")
            
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView(fvvm: fvvm)) {
                        Image(systemName: "star.fill")
                            .font(.callout)
                            .foregroundColor(.blue)
                        
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.fill")
                            .font(.callout)
                            .foregroundColor(.blue)
                    }
                    .buttonStyle(.plain)
                }
            
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: UserRitualsView()) {
                        Image(systemName: "pencil")
                            .font(.callout)
                        Text("Your Rituals")
                    }
                }
            }
        }
    }
}

#Preview {
    RitualsView(fvvm: FavoritesViewModel())
        .environmentObject(ViewModel())
}
