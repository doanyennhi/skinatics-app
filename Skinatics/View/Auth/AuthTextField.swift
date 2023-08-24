//
//  AuthTextField.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import SwiftUI

struct AuthTextField: View {
    
    var isSecure: Bool
    var title: String
    @Binding var text: String
    
    
    var body: some View {
        if isSecure {
            SecureField(title, text: $text)
                .textFieldStyle(CustomTextFieldStyle())

        } else {
            TextField(title, text: $text)
                .textFieldStyle(CustomTextFieldStyle())
        }
            
    }
}

//struct AuthTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthTextField()
//    }
//}
