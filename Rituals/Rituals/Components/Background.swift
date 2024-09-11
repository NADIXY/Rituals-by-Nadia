//
//  BackgroundView.swift
//  Rituals
//
//  Created by Nadia on 02.09.24.
//

import SwiftUI

struct Background: View {
    @State private var animatedGradient = false
    
    var body: some View {
        LinearGradient(colors: [.brown, .yellow, .brown, .brown], startPoint: animatedGradient ? .topLeading:
                .bottomLeading, endPoint: animatedGradient ? .bottomTrailing: .topTrailing)
        .ignoresSafeArea()
        .onAppear { withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true))
            {
                animatedGradient.toggle()
            }
        }
    }
}

#Preview {
    Background()
}
