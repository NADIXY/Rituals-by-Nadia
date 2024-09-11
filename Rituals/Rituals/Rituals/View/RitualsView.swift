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
            
                 
                Text("The newest Users")
                    .font(.title)
                    .foregroundColor(.black)
                    .bold()
                
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
                    .buttonStyle(.plain)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.fill")
                            .font(.callout)
                            .foregroundColor(.blue)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: ApiUserListView(apiUserListVM: ApiUserListVM())) {
                        Image(systemName: "person.2")
                            .font(.callout)
                    }
                }
                
                ToolbarItem(placement: .status) {
                    NavigationLink(destination: AboutMagicView()) {
                        Image(systemName: "list.triangle")
                            .font(.callout)
                    }
                }
            
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: UserRitualsView()) {
                        Image(systemName: "pencil")
                            .font(.callout)
                    }
                }
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


