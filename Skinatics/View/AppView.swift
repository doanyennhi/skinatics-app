//
//  AppView.swift
//  Skinatics
//
//  Created by Nhii on 1/10/2023.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var authenticator: Authenticator
    @State var isLoading: Bool = false
    
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
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
