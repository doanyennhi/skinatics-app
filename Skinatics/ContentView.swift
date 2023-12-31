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
 
struct ContentView: View {
    @StateObject var authenticator = Authenticator()

    var body: some View {
        AppView()
        .environmentObject(authenticator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
