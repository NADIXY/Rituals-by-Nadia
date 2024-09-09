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
            ScrollView {
                VStack {
                    ForEach(apiUserListVM.users, id: \.id) { user in
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text("\(user.name)")
                                .bold()
                            Text("\(user.email)")
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.opacity(0.3))
                        .cornerRadius(10)
                        .padding(10)
  
                    }
                    .navigationTitle("UsersList")
                    
                }.onAppear {
                    apiUserListVM.fetchAllUsers()
                }
            }
            .background(BackgroundView())
        }
    }
}


#Preview {
    ApiUserListView(apiUserListVM: ApiUserListVM())
}
