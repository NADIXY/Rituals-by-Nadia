//
//  ApiUserListView.swift
//  Rituals
//
//  Created by Nadia on 08.09.24.
//

import SwiftUI

struct ApiUserListView: View {
    @StateObject var apiUserListVM = ApiUserListVM()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(apiUserListVM.users, id: \.id) { user in
                        HStack {
                            Text("\(user.initials)")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Background())
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text("\(user.name)")
                                    .bold()
                                Text("\(user.email)")
                            }
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.background.opacity(0.3))
                        .cornerRadius(10)
                        .padding(10)
  
                    }
                    .navigationTitle("Users")
                    
                }.onAppear {
                    apiUserListVM.fetchAllUsers()
                }
            }
            .background(Background())
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

