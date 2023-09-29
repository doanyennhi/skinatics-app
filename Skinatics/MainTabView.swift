//
//  MainView.swift
//  Skinatics
//
//  Created by Nhii on 12/9/2023.
//

import SwiftUI


struct MainTabView: View {
    var user: User
    @State private var products: [Product]?
    @State var isLoading = false
    
    func getProducts() async {
        guard let request = setRequestHeader(link: "https://sephora.p.rapidapi.com/products/v2/list?number=1&size=10&country=AU&language=en-AU&root_category=skincare") else {
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
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
                    DispatchQueue.main.async {
                        self.products = decodedData.data
                    }
                }
            } catch {
                print(error.localizedDescription)
                self.products = nil
            }
        }.resume()
    }
    
    var body: some View {
        TabView {
            HomeView(user: user, products: $products, isLoading: $isLoading)
                .tabItem({
                    Label("Home", systemImage: "house")
                })
            
            SearchView()
                .tabItem({
                    Label("Search", systemImage: "magnifying.glass")
                })
            
            SkinPhotoView()
                .tabItem({
                    Label("Camera", systemImage: "camera.circle.fill")
                })
            
            ProfileView(user)
                .tabItem({
                    Label("Profile", systemImage: "person.crop.circle")
                })
        }
        .task {
            if products == nil {
                isLoading = true
                // await getProducts()
                isLoading = false
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: users[1])
    }
}
