//
//  SettingsRowView.swift
//  Rituals
//
//  Created by Nadia on 27.08.24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintenColor: Color
    
    var body: some View {
        HStack (spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(.red)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
        
    }
}
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(imageName: "gear", title: "Version", tintenColor: Color(.systemGray))
    }
}
