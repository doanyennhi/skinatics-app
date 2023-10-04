//
//  SignUpView.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// mock user data
var users = [User(name: "Itoshi Rin", email: "rin0909@gmail.com", password: "0909RinItoshi", skinTypes: [], skinIssues: [], skinConditions: []), User(name: "Itoshi Sae Nagiseishiro06", email: "sae10@gmail.com", password: "1010Itoshisae", skinTypes: ["Dry", "Acne-prone"], skinIssues: ["Dark spots", "Redness"], skinConditions: [])]


struct SignUpView: View {
    @State private var fullName: String = ""
    @EnvironmentObject var authenticator: Authenticator
    
    @State private var showNextView = false     // check if app should navigate to next screen
    @State private var isLoading = false       // check if funtion is running
    // track if error messages are displayed
    @State var showError = false

    func updateName() -> Bool {
        // show error if name is invalid
        if !fullName.isNameValid() {
            return false
        } else {
            authenticator.user.userMetadata["name"] = fullName
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
                        ErrorText(show: $showError, text: "Please enter a valid name")
                        
                        TextField("Full Name", text: $fullName)
                            .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 60)
                        
                        // TODO: link with actual screens
                        Text("By continuing, you agree to our")
                        HStack {
                            NavigationLink(destination: EmptyView(), label: {Text("Terms").bold()})
                            Text("and")
                            NavigationLink(destination: EmptyView(), label: {Text("Privacy Policy").bold()})
                        }
                        .padding(.bottom)
                        // disable navigation when loading
                        Button (action: {
                            // loading to validate input
                            isLoading = true
                            let isUpdated = updateName()
                            if isUpdated {
                                showNextView = true
                            } else {
                                showError = true
                            }
                            isLoading = false
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
                            SkinQuizView()
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
