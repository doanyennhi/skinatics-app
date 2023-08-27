//
//  LoginView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var currentUser: User = User()
    @State private var email: String = ""
    @State private var pwd: String = ""
    
    // check if app should navigate to next screen
    @State private var showNextView = false
    // check if funtion is running
    @State private var isLoading = false
    
    // track display of error messages
    @State private var showError = false
    @State private var showEmptyWarning = false
    
    // Return true if login successful, false otherwise
    func isLogin() async -> Bool {
        // show error if any fields are empty
        if email.isEmpty || pwd.isEmpty {
            showEmptyWarning = true
            return false
        } else {
            showEmptyWarning = false
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            // check if email and password entered match with any existing users
            for user in users {
                if user.email == email && user.password == pwd {
                    print("Login success")
                    currentUser = user
                    return true
                }
            }
            // show error if not match
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
                
                // Error message and login fields
                ErrorText(show: $showError, text: "Your email or password is incorrect. Please try again.")
                
                ErrorText(show: $showEmptyWarning, text: "Please fill in all the fields.")
                
                TextField("Email", text: $email)
                    .textFieldStyle(CustomTextFieldStyle())
                    
                SecureField("Password", text: $pwd)
                    .textFieldStyle(CustomTextFieldStyle())
    
                // Forgot password link
                NavigationLink(destination: EmptyView()) {
                    Text("Forgot password?")
                        .underline()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, 60)
                
                // disable when run login function
                Button (action: {
                    // start running function
                    isLoading = true
                        Task {
                            // navigate if login successful
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
                // go to skin quiz if user has not completed it, go to Home otherwise
                .navigationDestination(isPresented: $showNextView, destination: {
                    if currentUser.skinTypes.isEmpty || currentUser.skinIssues.isEmpty {
                        SkinQuizView(user: currentUser).navigationBarBackButtonHidden()
                    } else {
                        HomeView(user: currentUser).navigationBarBackButtonHidden()
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
