//
//  ContentView.swift
//  Rituals
//
//  Created by Nadia on 23.08.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            //wenn eine Benutzersitzung gibt, wenn nicht gleich null, wird an die Profilansicht weitergeleitet
            if viewModel.userSession != nil {
                MainView()
            } else {
                //sonst, wenn der Wert gleich null ist, leitet an die Loginansicht
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
    
}
