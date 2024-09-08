//
//  ApiUserListView.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import SwiftUI

struct ApiUserListView: View {
    
    @ObservedObject var apiUserListVM: ApiUserListVM
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(apiUserListVM.users, id: \.id) { user in
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("\(user.name)")
                        Text("\(user.email)")
                    }
                    
                }
                .cornerRadius(.maximum(20,20))
                
                
                .navigationTitle("UsersList")
                
            }.onAppear {
                apiUserListVM.fetchAllUsers()
                    
            }
            .padding(.all, 30)
            .background(BackgroundView())
            
            .shadow(color: .black.opacity(0.9), radius: 8, x: 5, y: 8)
        }
    }
}


#Preview {
    ApiUserListView(apiUserListVM: ApiUserListVM())
}
