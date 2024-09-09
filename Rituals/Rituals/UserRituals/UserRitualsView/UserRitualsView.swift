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
            
            Text("\(authViewModel.currentUser?.fullname ?? "")'s Rituals")
                .font(.title)
                .foregroundColor(.black)
                .bold()
                .padding()

            VStack {
                ScrollView {
                    VStack {
                        ForEach(mainViewModel.userRituals) { item in
                            NavigationLink {
                                UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: item),
                                                      isPresented: $showEditUserRituals)
                            } label: {
                                VStack(alignment: .leading, spacing: 8.0) {
                                    
                                    Text(item.title ?? "")
                                        .lineLimit(2)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .bold()
                                    
                                    Text(item.text)
                                        .lineLimit(2)
                                        .foregroundColor(.black)
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.background.opacity(0.3))
                                .cornerRadius(10)
                                .padding(10)
                            }
                            
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
            
            .background(BackgroundView())
            .cornerRadius(.maximum(20,20))
            }
                
            .toolbar {
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
            
            .sheet(isPresented: $showAddUserRituals) {
                AddUserRitualsView(isPresented: $showAddUserRituals)
            }
            .navigationTitle("Your Rituals")
            .padding(.all, 30)
            .background(BackgroundView())
            .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
            
        
        }
    }

#Preview {
    UserRitualsView()
}
