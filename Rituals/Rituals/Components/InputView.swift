//
//  InputView.swift
//  Rituals
//
//  Created by Nadia on 26.08.24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false //Sicheres Feld mit standart
    
    var body: some View {
        //Vorderkante ausrichten und Abstand mit Pixel
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)//Schriftstärke
                .font(.footnote)
            //ob es sich um sichere Felder handelt
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()//Teiler
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
//Punktkonstante 'text' leer lassen
        InputView(text: .constant(""), title: "Email Address", placeholder: "name@icloud.com")
    }
}
