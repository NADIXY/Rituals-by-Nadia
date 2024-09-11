//
//  ProfileView.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            if let user = viewModel.currentUser {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 72, height: 72)
                                .background(Background())
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .accentColor(.gray)
                            }
                        }
                    }
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gear",
                                            title: "Version",
                                            tintenColor: Color(.systemGray))
                            Spacer()
                            
                            Text("1.0.0")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    Section(header: Text("Dark Mode")) {     // Umschalter Dark/Light hierv wird der Zustand von isDarkMode festgelegt
                        Toggle(isOn: $isDarkMode) {
                            Text("Dark Mode")
                        }
                    }
                    
                    Section("Account") {
                        Button {
                            viewModel.signOut()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill",
                                            title: "Sign Out",
                                            tintenColor: .red)
                        }
                        Button {
                            Task {
                                try await viewModel.deleteAccount()
                            }
                            
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill",
                                            title: "Delet Account",
                                            tintenColor: .red)
                            
                        }
                    }
                    
                }
                
                .navigationTitle("Profile")
                
            }
                
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

 
#Preview {
    ProfileView()
}
