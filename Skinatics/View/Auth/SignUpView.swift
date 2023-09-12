//
//  SignUpView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// mock user data
var users = [User(name: "Itoshi Rin", email: "rin0909@gmail.com", password: "123Rin", skinTypes: [], skinIssues: [], skinConditions: []), User(name: "Itoshi Sae", email: "sae10@gmail.com", password: "1010Sae", skinTypes: ["Dry", "Acne-prone"], skinIssues: ["Dark spots", "Redness"], skinConditions: [])]


struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var pwd: String = ""
    @State private var confirmPwd: String = ""
    @State var user: User = User()
    
    @State private var showNextView = false     // check if app should navigate to next screen
    @State private var isLoading = false       // check if funtion is running
    
    // track if error messages are displayed
    @State var showEmptyWarning = false
    @State var showInvalidEmail = false

    // check if two password fields are identical
    var isPasswordDifferent: Binding<Bool> { Binding (
        get: {!confirmPassword(pwd: pwd, confirmPwd: confirmPwd)},
        set: {_ in }
        )
    }

    /// Return true if pass all conditions, false otherwise
    func isSignUp() async -> Bool {
        // show error message for empty fields
        if email.isEmpty || pwd.isEmpty || name.isEmpty || confirmPwd.isEmpty {
            showEmptyWarning = true
            return false
        } else { showEmptyWarning = false }
        
        // show error message for invalid email
        if !validateEmail(email: email) {
            showInvalidEmail = true
            return false
        } else { showInvalidEmail = false }
            
        // show error if two password fields are different
        if !confirmPassword(pwd: pwd, confirmPwd: confirmPwd) {
            return false
        } else {
            // loading time
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            // add new user
            user.name = name
            user.email = email
            user.password = pwd
            users.append(user)
            return true
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView {
                    VStack {
                        Text("Sign Up").largeTitle()
                        Text("Create an account to start your skincare journey")
                            .subheading()
                            .padding(.bottom, 30)
                        
                        // Error messages and fields for sign up
                        ErrorText(show: $showEmptyWarning, text: "Please fill in all the fields.")
                        
                        TextField("Name", text: $name)
                            .textFieldStyle(CustomTextFieldStyle())
                        
                        VStack {
                            ErrorText(show: $showInvalidEmail, text: "Invalid email address")
                            TextField("Email", text: $email)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        
                        SecureField("Password", text: $pwd)
                            .textFieldStyle(CustomTextFieldStyle())
                        
                        VStack {
                            ErrorText(show: isPasswordDifferent, text: "Password does not match")
                            SecureField("Confirm password", text: $confirmPwd)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        .padding(.bottom, 60)
                        
                        // disable navigation when loading
                        Button (action: {
                            // loading to run sign up function
                            isLoading = true
                                Task {
                                    // navigate to next screen if sign up successful
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
                    .frame(minHeight: geometry.size.height)
                }
                .modifier(ScreenModifier())
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
