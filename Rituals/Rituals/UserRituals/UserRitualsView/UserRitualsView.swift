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
            List(mainViewModel.userRituals) { item in
                NavigationLink {
                    UpdateUserRitualsView(viewModel: UpdateUserRitualsViewModel(userRituals: item),
                                   isPresented: $showEditUserRituals)
                } label: {
                    Text(item.text)
                        .swipeActions {
                            Button {
                                mainViewModel.deleteUserRituals(thisUserRitualsId: item.id)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }

            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Your Rituals, \(authViewModel.currentUser?.fullname ?? "")")
                }
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
        }
    }
}

#Preview {
    UserRitualsView()
}
