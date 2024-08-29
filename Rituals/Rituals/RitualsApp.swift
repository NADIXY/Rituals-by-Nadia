//
//  RitualsApp.swift
//  Rituals
//
//  Created by Nadia on 23.08.24.
//

import SwiftUI
import Firebase
//import FirebaseAuth

@main
struct RitualsApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        print("Firebase wurde konfiguriert")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
