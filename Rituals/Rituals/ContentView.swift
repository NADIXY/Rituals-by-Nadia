//
//  ContentView.swift
//  Rituals
//
//  Created by Nadia on 23.08.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var vm = ViewModel()
    @StateObject var fvvm = FavoritesViewModel()
    @StateObject var apiUserListVM = ApiUserListVM()
    
    @State private var isActive = false
    @State private var scale: CGFloat = 3.0
    @State private var opacity: Double = 0.0
    @State private var animatedGradient = false
    
    var body: some View {
        Group {
            //wenn eine Benutzersitzung gibt, wenn nicht gleich null, wird an die Profilansicht weitergeleitet
            if viewModel.userSession != nil {
                RitualsView(fvvm: fvvm, apiUserListVM: apiUserListVM)
                    .environmentObject(vm)
            } else {
                if isActive {
                    //sonst, wenn der Wert gleich null ist, leitet an die Loginansicht
                    LoginView()
                } else {
                    ZStack {
                        LinearGradient(colors: [.brown, .yellow, .brown, .brown], startPoint: animatedGradient ? .topLeading:
                                .bottomLeading, endPoint: animatedGradient ? .bottomTrailing: .topTrailing)
                        .ignoresSafeArea()
                        
                        VStack {
                            Text("RITUALS")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .scaleEffect(scale)
                            
                            Image("logoT")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .scaleEffect(scale)

                                .onAppear {
                                    withAnimation(Animation.easeInOut(duration: 2.0)) {
                                        scale = 1.0
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
                                        withAnimation {
                                            isActive = true
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}
    

#Preview {
    ContentView()
}
