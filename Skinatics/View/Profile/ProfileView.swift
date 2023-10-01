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
    @State private var showAlert = false
    @State private var errorMessage = ""
    @State var isLoading: Bool = false
    
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
                        .padding(.bottom, 40)
                    
                    VStack(alignment: .leading) {
                        Text("Name").title()
                            .padding(.vertical, 5)
                        Text(authenticator.user.userMetadata["name"] as? String ?? "Nhi")
                        
                        Text("Email").title()
                            .padding(.vertical, 5)
                        Text(authenticator.user.email)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
//                    // User info
//                    EditField(title: "Name", text: authenticator.user.userMetadata["name"] as? String ?? "")
//                    EditField(title: "Email", text: authenticator.user.email)

                    // Skin Info
                    HStack(alignment: .firstTextBaseline) {
                        Text("My Skin").title()
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        NavigationLink(destination: SkinQuizView(), label: { Text("Edit")
                                .font(Font.custom("Avenir", size: 16))
                                .foregroundColor(Color("Secondary Green"))
                                .fontWeight(.semibold)
                        })
                    }
                    
                    SkinInfo(title: "Skin Type", items: authenticator.user.userMetadata["skinType"] as? [String] ?? [""], isLoading: $isLoading)
                    
                    SkinInfo(title: "Skin Conditions", items: authenticator.user.userMetadata["skinConditions"] as? [String] ?? [""], isLoading: $isLoading)
                    
                    SkinInfo(title: "I Need Help With...", items: authenticator.user.userMetadata["skinIssues"] as? [String] ?? [""], isLoading: $isLoading)
                    
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
        ProfileView()
            .environmentObject(Authenticator())
    }
}
