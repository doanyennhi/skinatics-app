//
//  LoginView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// TODO: Add comments
struct LoginView: View {
    
    @State private var currentUser: User = User()
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var showNextView = false
    @State private var isLoading = false
    @State var showError = false
    @State var showEmptyWarning = false
    
    func isLogin() async -> Bool {
        if isTextEmpty(text: email) || isTextEmpty(text: pwd) {
            showEmptyWarning = true
            return false
        } else {
            showEmptyWarning = false
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            for user in users {
                if user.email == email && user.password == pwd {
                    print("Login success")
                    currentUser = user
                    return true
                }
            }
            showError = true
            print("Unsuccess")
            return false
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "Welcome back!")
                Subheading(subheading: "Please sign into your account")
                    .padding(.bottom, 30)
                
                ErrorText(show: $showError, text: "Your email or password is incorrect. Please try again.")
                
                ErrorText(show: $showEmptyWarning, text: "Please fill in all the fields.")
                
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
                
                
                Button (action: {
                    isLoading = true
                        Task {
                            showNextView = await isLogin()
                            isLoading = false
                        }
                }, label: {
                    if isLoading {
                        ProgressView()
                            .tint(Color("White"))
                    } else {
                        Text("Sign In")
                    }
                })
                .buttonStyle(PrimaryButtonStyle())
                .disabled(isLoading)
                .navigationDestination(isPresented: $showNextView, destination: {
                    if currentUser.skinTypes.isEmpty || currentUser.skinIssues.isEmpty {
                        SkinQuizView(user: currentUser).navigationBarBackButtonHidden()
                    } else {
                       HomeView().navigationBarBackButtonHidden()
                    }
                })
                
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
