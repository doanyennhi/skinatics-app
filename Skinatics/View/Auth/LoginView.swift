//
//  LoginView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var pwd: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "Welcome back!")
                Subheading(subheading: "Please sign into your account")
                    .padding(.bottom, 30)
                
                TextField("Email", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                SecureField("Password", text: $pwd)
                    .textFieldStyle(CustomTextFieldStyle())
                
                NavigationLink(destination: EmptyView()) {
                    Text("Forgot password?")
                        .underline()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 60)
                
                
                NavigationLink(destination: SkinQuizView()
                    .navigationBarBackButtonHidden(true)) {
                    Text("Sign In")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.bottom, 20)

                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()
                        .navigationBarBackButtonHidden(true)) {
                        Text("Sign Up")
                            .bold()
                            .underline()
                    }
                }
            }
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
