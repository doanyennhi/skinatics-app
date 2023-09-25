//
//  SignUpView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// mock user data
var users = [User(name: "Itoshi Rin", email: "rin0909@gmail.com", password: "123Rin", skinTypes: [], skinIssues: [], skinConditions: []), User(name: "Itoshi Sae", email: "sae10@gmail.com", password: "1010Itoshisae", skinTypes: ["Dry", "Acne-prone"], skinIssues: ["Dark spots", "Redness"], skinConditions: [])]


struct SignUpView: View {
    @State private var name: String = ""
    @State var user: User = User()
    
    @State private var showNextView = false     // check if app should navigate to next screen
    @State private var isLoading = false       // check if funtion is running
    
    // track if error messages are displayed
    @State var showError = false

    /// Return true if pass all conditions, false otherwise
    func validate() async -> Bool {
        // show error if name is invalid
        if !isNameValid(name: name) {
            showError = true
            return false
        } else {
            showError = false
            // loading time
            try? await Task.sleep(nanoseconds: 2 * 1_000_000_000)
            
            // add new user
            user.name = name
            users.append(user)
            return true
        }
    }
    
    var body: some View {
            NavigationStack {
                    VStack {
                        Text("Tell Us About Yourself").largeTitle(multilineCenter: true)
                        Text("This can help us personalize and deliver the best experience for you")
                            .subheading()
                            .padding(.bottom, 30)
                        
                        // Error messages and fields for sign up
                        ErrorText(show: $showError, text: "Please enter a valid name.")
                        
                        TextField("Name", text: $name)
                            .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 60)
                        
                        Text("By continuing, you agree to our")
                        HStack {
                            NavigationLink(destination: EmptyView(), label: {Text("Terms").bold()})
                            Text("and")
                            NavigationLink(destination: EmptyView(), label: {Text("Privacy Policy").bold()})
                        }
                        .padding(.bottom)
                        // disable navigation when loading
                        Button (action: {
                            // loading to run sign up function
                            isLoading = true
                                Task {
                                    // navigate to next screen if sign up successful
                                    showNextView = await validate()
                                    isLoading = false
                            }
                        }, label: {
                            if isLoading {
                                ProgressView()
                                    .tint(Color("White"))
                            } else {
                                Text("Next")
                            }
                        })
                        .buttonStyle(PrimaryButtonStyle())
                        .disabled(isLoading)
                        .navigationDestination(isPresented: $showNextView, destination: {
                            SkinQuizView(user: user)
                        })
                    }
                    .modifier(ScreenModifier())
            }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
