//
//  MainView.swift
//  Rituals
//
//  Created by Nadia on 29.08.24.
//

import SwiftUI
import FirebaseFirestore

struct RitualsView: View {
    @EnvironmentObject var vm: ViewModel
    @ObservedObject var fvvm: FavoritesViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var apiUserListVM: ApiUserListVM
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @FirestoreQuery(collectionPath: "rituals") var items: [Rituals]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Welcome, \(authViewModel.currentUser?.fullname ?? "")")
                    .font(.title2)
                
                Image("logo")
                    .resizable()//größe verändern
                    .scaledToFill()//um ihn zu füllen
                    .frame(width: 250, height: 250)// Rahmen mit einer Breite geben
                    .cornerRadius(.maximum(20, 20))
                    .padding(.vertical, 32)//Punkt abstand mit Pixel)
                
                NavigationLink(destination: ApiUserListView()) {
                    
                    Text("The newest Users")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .bold()
                    Image(systemName: "arrow.right")
                        .foregroundColor(.yellow)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(apiUserListVM.users, id: \.id) { user in
                            HStack {
                                Text("\(user.initials)")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 72, height: 72)
                                    .background(Background())
                                    .clipShape(Circle())
                            }
                        }
                    }.onAppear {
                        apiUserListVM.fetchAllUsers()
                        fvvm.getFavoriteRituals()
                    }
                }

                Text("Recommended Rituals")
                    .font(.title)
                    .bold()
                    .padding()
                                                
                ForEach(items) { item in
                    NavigationLink(destination: DetailView(ritual: item)) {
                        RitualsCardView(ritual: item)
                            .environmentObject(fvvm)
                            .environmentObject(vm)
                    }
                    .buttonStyle(.plain)
                }
            }

            .padding(.horizontal, 10)
            .background(Background())
            .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)

            // MARK: - Navigation Bar
            
            .navigationTitle("Rituals")
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavoritesView(fvvm: fvvm)) {
                        Image(systemName: "star.circle.fill")
                            .font(.callout)
                            .foregroundColor(.blue)
                        
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: VideoView()) {
                        Image(systemName: "video.badge.plus")
                            .font(.callout)
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.callout)
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .status) {
                    
                    NavigationLink(destination: ApiUserListView(apiUserListVM: ApiUserListVM())) {
                        VStack(alignment: .center, spacing: 1.0) {
                            Image(systemName: "person.2.circle")
                                .foregroundColor(.black)
                            Text("Users")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                ToolbarItem(placement: .status) {
                    NavigationLink(destination: AboutMagicView()) {
                        VStack(alignment: .center, spacing: 1.0) {
                            Image(systemName: "exclamationmark.warninglight.fill")
                                .foregroundColor(.black)
                            Text("About Magic")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                            
                    }
                }
            
                ToolbarItem(placement: .status) {
                    NavigationLink(destination: UserRitualsView()) {
                        VStack(alignment: .center, spacing: 1.0) {
                            Image(systemName: "note.text.badge.plus")
                                .foregroundColor(.black)
                            Text("Your Rituals")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                ToolbarItem(placement: .status) {
                    NavigationLink(destination: VideoView()) {
                        VStack(alignment: .center, spacing: 1.0) {
                            Image(systemName: "person.crop.square.badge.video")
                                .foregroundColor(.black)
                            Text("Community Videos")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                ToolbarItem(placement: .status) {
                    NavigationLink(destination: VideoView()) {
                        VStack(alignment: .center, spacing: 1.0) {
                            Image(systemName: "map.circle")
                                .foregroundColor(.black)
                            Text("Map")
                                .font(.caption2)
                                .foregroundColor(.black)
                        }
                    }
                }
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
