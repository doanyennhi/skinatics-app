//
//  SignUpView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var confirmPwd: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "Sign Up")
                Subheading(subheading: "Create an account to start your skincare journey")
                
                TextField("Name", text: $name)
                    .textFieldStyle(CustomTextFieldStyle())
                TextField("Email", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                SecureField("Password", text: $pwd)
                    .textFieldStyle(CustomTextFieldStyle())
                SecureField("Confirm password", text: $confirmPwd)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
