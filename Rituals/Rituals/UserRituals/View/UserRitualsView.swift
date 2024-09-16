//
//  UserRitualsView.swift
//  Rituals
//
//  Created by Nadia on 30.08.24.
//

import SwiftUI

struct UserRitualsView: View {
    @StateObject var mainViewModel = UserRitualsViewModel()
    @State var showAddUserRituals: Bool = false
    @State var showEditUserRituals: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            Image("logo")
                .resizable()//größe verändern
                .scaledToFill()//um ihn zu füllen
                .frame(width: 250, height: 250)// Rahmen mit einer Breite geben
                .cornerRadius(.maximum(20, 20))
                .padding(.vertical, 32)//Punkt abstand mit Pixel

            Text("Your Rituals, \(authViewModel.currentUser?.fullname ?? "")")
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
            ZStack {
                List(mainViewModel.userRituals) { item in
                    NavigationLink {
                        UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: item),
                                              isPresented: $showEditUserRituals)
                    } label: {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(item.title ?? "")
                                .lineLimit(2)
                                .foregroundColor(.yellow)
                            
                            Text(item.text)
                                .lineLimit(2)
                                .swipeActions {
                                    Button {
                                        mainViewModel.deleteUserRituals(thisUserRitualsId: item.id)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                            
                            Text("\(Date())")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddUserRituals.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            
            .onAppear {
                Task {
                    await authViewModel.fetchUser()
                }
                
                mainViewModel.getUserRituals()
            }
            
            .onChange(of: showAddUserRituals) {
                if showAddUserRituals == false {
                    mainViewModel.getUserRituals()
                }
            }
            .cornerRadius(.maximum(20, 20))
            .sheet(isPresented: $showAddUserRituals) {
                AddUserRitualsView(isPresented: $showAddUserRituals)
            }
            .navigationTitle("Your Rituals")
        }
        .padding(.all, 30)
        .background(Background())
        .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
        
        //.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    UserRitualsView()
}
