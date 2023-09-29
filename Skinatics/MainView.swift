//
//  MainView.swift
//  Skinatics
//
//  Created by Nhii on 29/9/2023.
//

import SwiftUI
import Auth0

struct MainView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @State var isLoading = false
    
    func getCredentials() async {
        isLoading = true
        do {
            let credentials = try await authenticator.credentialsManager.credentials()
            self.authenticator.user = Profile.from(credentials.idToken)
            await getMetadata(accessToken: credentials.accessToken, userId: authenticator.user.id)
        } catch {
            print("Failed with: \(error.localizedDescription)")
            isLoading = false
        }
    }
    
    func getMetadata(accessToken: String, userId: String) async {
        Auth0
                    .users(token: accessToken)
                    .get(userId, fields: ["user_metadata", "app_metadata"])
                    .start { result in
                        switch result {
                        case .failure(let error):
                            print("Error: \(error.localizedDescription)")
                            isLoading = false
                            
                        case .success(let metadata):
                            // Get user metadata
                            DispatchQueue.main.async {
                                authenticator.user.userMetadata = metadata["user_metadata"] as? [String: Any] ?? [:]
                                authenticator.user.appMetadata = metadata["app_metadata"] as? [String: Any] ?? [:]
                                isLoading = false
                            }
                        }
                    }
    }
    
    var body: some View {
        NavigationStack {
            let didFinishSignUp = authenticator.user.appMetadata["didFinishSignUp"] as? Int ?? 0

            if isLoading {
                ProgressView()
            } else {
                if  didFinishSignUp == 1 {
                    MainTabView(user: users[1])
                } else {
                    SignUpView()
                }
            }
        }
        .task {
            await getCredentials()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
