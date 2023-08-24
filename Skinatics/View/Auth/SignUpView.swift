//
//  SignUpView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

var users = [User(name: "Itoshi Rin", email: "rin0909@gmail.com", password: "123Rin", skinTypes: [], skinIssues: [], skinConditions: []), User(name: "Itoshi Sae", email: "sae10@gmail.com", password: "1010Sae", skinTypes: ["Dry"], skinIssues: ["Dark spots", "Redness"], skinConditions: [])]

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var showNextView = false
    @State private var isLoading = false
    @State var showEmptyWarning = false
    @State private var confirmPwd: String = ""
    var isPasswordSame: Binding<Bool> { Binding (
        get: {!confirmPassword(pwd: pwd, confirmPwd: confirmPwd)},
        set: {_ in }
        )
    }
    @State var user: User = User()
    
    func isSignUp() async -> Bool {
        showEmptyWarning = false
        
        if isTextEmpty(text: email) || isTextEmpty(text: pwd) || isTextEmpty(text: name) || isTextEmpty(text: confirmPwd) {
            showEmptyWarning = true
            return false
        }
            
        if !confirmPassword(pwd: pwd, confirmPwd: confirmPwd) {
            return false
        } else {
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            user.name = name
            user.email = email
            user.password = pwd
            users.append(user)
            return true
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "Sign Up")
                Subheading(subheading: "Create an account to start your skincare journey")
                    .padding(.bottom, 30)
                
                ErrorText(show: $showEmptyWarning, text: "Please fill in all the fields.")
                
                TextField("Name", text: $name)
                    .textFieldStyle(CustomTextFieldStyle())
                TextField("Email", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                SecureField("Password", text: $pwd)
                    .textFieldStyle(CustomTextFieldStyle())
                
                ErrorText(show: isPasswordSame, text: "Password does not match")
                
                SecureField("Confirm password", text: $confirmPwd)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 60)
                
                Button (action: {
                    isLoading = true
                        Task {
                            showNextView = await isSignUp()
                            isLoading = false
                    }
                }, label: {
                    if isLoading {
                        ProgressView()
                            .tint(Color("White"))
                    } else {
                        Text("Sign Up")
                    }
                })
                .buttonStyle(PrimaryButtonStyle())
                .disabled(isLoading)
                .navigationDestination(isPresented: $showNextView, destination: {
                    LoginView().navigationBarBackButtonHidden()
                })
                
//                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
//                    Text("Sign Up")
//                }
//                .buttonStyle(PrimaryButtonStyle())
//                .padding(.bottom, 20)
//                .simultaneousGesture(
//                    TapGesture().onEnded {
//                        user.name = name
//                        user.email = email
//                        user.password = pwd
//                        users.append(user)
//                })
                
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()
                        .navigationBarBackButtonHidden(true)) {
                        Text("Login")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
