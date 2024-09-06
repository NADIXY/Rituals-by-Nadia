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
    
    var body: some View {
        NavigationStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("Your Rituals, \(authViewModel.currentUser?.fullname ?? "")")
                .font(.title2).bold()
                .foregroundColor(.brown)
            
            ZStack {
                
                List(mainViewModel.userRituals) { item in
                    NavigationLink {
                        UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: item),
                                              isPresented: $showEditUserRituals)
                    } label: {
                        VStack(alignment: .leading, spacing: 8.0) {
                            BackgroundView()
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
                        }
                        
                    }
                }
                
            }
            
            .toolbar {
                /*ToolbarItem(placement: .principal) {
                    Text("Your Rituals, \(authViewModel.currentUser?.fullname ?? "")")
                }*/
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddUserRituals.toggle()
                    } label: {
                        Image(systemName: "plus")
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
        .background(.secondary.opacity(0.2))
        .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
    }
}

#Preview {
    UserRitualsView()
}
