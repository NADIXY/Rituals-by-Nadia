//
//  InfoView.swift
//  Rituals
//
//  Created by Nadia on 30.09.24.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack {
                    
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        .cornerRadius(.maximum(20, 20))
                        .padding(.vertical, 32)
                    
                    VStack(alignment: .center, spacing: 20 ) {
                        
                        Text("Rituals")
                            .bold()
                            .font(.title)
                        Text("Unlock the power of rituals - Dive into the world of magic!")
                            .font(.custom("Georgia", size: 28))
                            .bold()
                        
                        Text("Discover Rituale, favorite your favorite rituals, create your own rituals, share your Rituals step-by-step instructions for performing Rituals...")
                            .bold()
                            .italic()
    

                        Text("The Rituals App offers a unique platform to tauchen in the mystical world of magic. Discover carefully ge-gened rituals created by the founder of the app and create your own magical practices. If you're are looking for spiritual arell, protective rituals or just curiosity - the Rituals App has something to provide for everyone.")
                        
                        Text("Developer")
                            .bold()
                            .font(.title)
                        Text("This app was developed by Nadia Baptista. It uses SwiftUI and is written 100% in Swift.")
                            .fontWeight(.medium)
                        Text("Project Modul 4 - SwiftUI/Swift")
                        Text("Visit my GitHub 😉")
                        Link("github.com/NADIXY", destination: URL(string: "https://github.com/NADIXY")!)
                        Text("© Nadia Baptista, 2024")

                        Text("Application")
                            .bold()
                            .font(.title)
                        Link("Terms of Service", destination: URL(string: "https://www.google.com")!)
                        Link("Privacy Policy", destination: URL(string: "https://www.google.com")!)
                        Link("Company Website", destination: URL(string: "https://github.com/NADIXY")!)
                    }
                    
                }
                
                
            }
            .navigationTitle("Info")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.all, 30)
            .background(Background())

        }
        
    }
}


#Preview {
    InfoView()
}
