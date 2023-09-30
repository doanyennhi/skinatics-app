//
//  ContentView.swift
//  Skinatics
//
//  Created by Nhii on 14/8/2023.
//

import SwiftUI
import Auth0

class Authenticator: ObservableObject {
    @Published var isAuthenticated: Bool = false
    final let credentialsManager = CredentialsManager(authentication: authentication())
    @Published var user: Profile = Profile()
}
 
// TODO: implement profile
struct ContentView: View {
    @StateObject var authenticator = Authenticator()
    @State var isLoading: Bool = false
    
    func getCredentials() async {
        isLoading = true
        guard authenticator.credentialsManager.hasValid() else {
            authenticator.isAuthenticated = false
            isLoading = false
            print("Valid credentials")
            return
        }
        
        do {
            let credentials = try await authenticator.credentialsManager.credentials()
            self.authenticator.user = Profile.from(credentials.idToken)
            await getMetadata(accessToken: credentials.accessToken, userId: authenticator.user.id)
            authenticator.isAuthenticated = true
            isLoading = false
        } catch {
            print("Failed with: \(error.localizedDescription)")
            authenticator.isAuthenticated = false
            isLoading = false
        }
    }
    
    func getMetadata(accessToken: String, userId: String) async {
        Auth0
                    .users(token: accessToken)
                    .get(userId, fields: ["user_metadata"])
                    .start { result in
                        switch result {
                        case .failure(let error):
                            print("Error: \(error.localizedDescription)")
                            isLoading = false
                            
                        case .success(let metadata):
                            // Get user metadata
                            DispatchQueue.main.async {
                                authenticator.user.userMetadata = metadata["user_metadata"] as? [String: Any] ?? [:]
                                print(authenticator.user.userMetadata)
                            }
                        }
                    }
    }
    
    var body: some View {
        NavigationStack {
            if isLoading {
                ProgressView()
            } else {
                if authenticator.isAuthenticated {
                    if authenticator.user.userMetadata["didFinishSignUp"] as? Int ?? 0 == 1 {
                        MainTabView()
                    } else {
                        SignUpView()
                    }
                }  else {
                    StartUpView()
                }
            }
        }
        .environmentObject(authenticator)
        .task {
            await getCredentials()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
