//
//  RitualsApp.swift
//  Rituals
//
//  Created by Nadia on 23.08.24.
//

import SwiftUI
import Firebase

@main
struct RitualsApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
        print("Firebase wurde konfiguriert")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
