//
//  ProfileView.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI
import Auth0

/// Profile screen to show user info
struct ProfileView: View {
    // Current user
    @EnvironmentObject var authenticator: Authenticator
    @State private var user: User
    @State private var showAlert = false
    @State private var errorMessage = ""
    
    init(_ user: User) {
        _user = State(initialValue: user)
    }
    
    func logout() {
        Auth0
              .webAuth()
              .clearSession { result in
                switch result {
                  case .failure(let error):
                    errorMessage = "Error: \(error.localizedDescription)"
                    showAlert = true
                  case .success:
                    let isCleared = authenticator.credentialsManager.clear()
                    
                    if isCleared {
                        authenticator.isAuthenticated = false
                        authenticator.user = Profile()
                        showAlert = false
                    } else {
                        errorMessage = "There was an error while signing you out. Please try again."
                        showAlert = true
                    }
                }
              }
    }
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("My Profile").largeTitle(multilineCenter: true)
                    // Avatar
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 150)
                        .padding(.bottom, 60)
                    
                    // User info
                    EditField(title: "Name", text: authenticator.user.name)
                    EditField(title: "Email", text: authenticator.user.email)

                    // Skin Info
                    HStack {
                        Text("My Skin").title()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Edit")
                            .font(Font.custom("Avenir", size: 16))
                            .foregroundColor(Color("Secondary Green"))
                            .fontWeight(.semibold)
                    }
                    SkinInfo(title: "Skin Type", items: Array(user.skinTypes))
                    
                    SkinInfo(title: "Skin Conditions", items: Array(user.skinConditions))
                    
                    SkinInfo(title: "I Need Help With...", items: Array(user.skinIssues))
                    
                    Button(action: {
                        logout()
                    }, label: {
                        Text("Logout")
                    })
                        .bold()
                        .padding(.vertical, 15)
                        .padding(.horizontal, 50)
                        .foregroundColor(Color("White"))
                        .background(Color("Red"))
                        .cornerRadius(15)
                        .padding(.top, 60)
                }
                .padding(.vertical)
            }
            .alert("Logout Unsuccessful", isPresented: $showAlert, actions: {
                Button("OK", role: .cancel) {
                }
            }, message: {
                Text(errorMessage)
            })
            .modifier(ScreenModifier())
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(users[1])
            .environmentObject(Authenticator())
    }
}
