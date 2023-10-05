//
//  MainTabView.swift
//  Skinatics
//
//  Created by Nhii on 12/9/2023.
//

import SwiftUI

enum TabItem: String {
    case home
    case search
    case camera
    case routine
    case profile
}

class TabHandler: ObservableObject {
    @Published var currentTab: TabItem = .home
}

struct MainTabView: View {
    @StateObject var tabHandler = TabHandler()
    @State private var products: [Product]?
    @State var isLoading = false
    
    func getProducts() async {
        isLoading = true
        guard let request = setRequestHeader(link: "https://sephora.p.rapidapi.com/products/v2/list?number=1&size=10&country=AU&language=en-AU&root_category=skincare") else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                do {
                    // get error message if request unsuccessful
                    if (400...499).contains(res.statusCode) {
                        let decodedData = try JSONDecoder().decode(Error.self, from: data)
                        print(decodedData)
                        self.products = nil
                    } else {
                        // decode data
                        let decodedData = try JSONDecoder().decode(ProductsList.self, from: data)
                        
                        // send task back to main thread
                            self.products = decodedData.data
                    }
                    isLoading = false
                } catch {
                    print(error.localizedDescription)
                    self.products = nil
                    isLoading = false
                }
            }
        }.resume()
    }
    
    var body: some View {
        TabView(selection: $tabHandler.currentTab) {
            HomeView(products: $products, isLoading: $isLoading)
                .tabItem({
                    Label("Home", systemImage: "house")
                }).tag(TabItem.home)
            
            SearchView()
                .tabItem({
                    Label("Search", systemImage: "magnifyingglass")
                }).tag(TabItem.search)
            
            SkinPhotoView()
                .tabItem({
                    Label("Camera", systemImage: "camera")
                }).tag(TabItem.camera)
            
            RoutineView()
                .tabItem({
                    Label("Routine", systemImage: "list.bullet.clipboard")
                }).tag(TabItem.routine)
            
            ProfileView()
                .tabItem({
                    Label("Profile", systemImage: "person")
                }).tag(TabItem.profile)
        }
        .environmentObject(tabHandler)
        .task {
            if products == nil {
                await getProducts()
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(TabHandler())
    }
}
