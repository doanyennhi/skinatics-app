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
    
    func getCredentials() {
        isLoading = true
        guard authenticator.credentialsManager.hasValid() else {
            authenticator.isAuthenticated = false
            isLoading = false
            return
        }
        authenticator.isAuthenticated = true
        isLoading = false
    }
    
    var body: some View {
        NavigationStack {
            if isLoading {
                ProgressView()
            } else {
                if authenticator.isAuthenticated {
                    MainView()
                }  else {
                    StartUpView()
                }
            }
        }
        .environmentObject(authenticator)
        .onAppear(perform: getCredentials)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
