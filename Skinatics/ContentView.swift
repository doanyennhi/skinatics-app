//
//  ContentView.swift
//  Skinatics
//
//  Created by Nhii on 14/8/2023.
//

import SwiftUI
 
// TODO: implement logout, user token, profile
struct ContentView: View {
    @State private var isAuthenticated: Bool = false

    var body: some View {
        if !isAuthenticated {
            StartUpView(isAuthenticated: $isAuthenticated)
        }  else {
            MainView(user: users[1])
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
