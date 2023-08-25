//
//  ContentView.swift
//  Skinatics
//
//  Created by Nhii on 14/8/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // StartUpView()
        // SkinQuizView()
        TabView {
            HomeView()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            SearchView()
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            CameraView()
                .tabItem() {
                    Image(systemName: "camera.fill")
                    Text("Camera")
                }
            RoutineView()
                .tabItem() {
                    Image(systemName: "list.bullet")
                    Text("Routine")
                }
            ProfileView()
                .tabItem() {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
