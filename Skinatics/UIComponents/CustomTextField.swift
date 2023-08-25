//
//  AuthTextField.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// Define custom text field style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
           configuration
            .padding()
            .background(Color("White"))
            .cornerRadius(15)
            .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 2)
            .padding(.bottom, 10)
            .textInputAutocapitalization(.never)
       }
}
