//
//  MainView.swift
//  Skinatics
//
//  Created by Nhii on 12/9/2023.
//

import SwiftUI

struct MainView: View {
    var user: User
    
    var body: some View {
        TabView {
            HomeView(user: user)
                .tabItem({
                    Label("Home", systemImage: "house")
                })
            
            CameraView()
                .tabItem({
                    Label("Camera", systemImage: "camera.circle.fill")
                })
            
            ProfileView(user)
                .tabItem({
                    Label("Profile", systemImage: "person.crop.circle")
                })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(user: users[1])
    }
}
