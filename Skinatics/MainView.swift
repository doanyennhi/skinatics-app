//
//  MainView.swift
//  Skinatics
//
//  Created by Nhii on 12/9/2023.
//

import SwiftUI


struct MainView: View {
    var user: User
    @State private var products: [Product] = []
    @State var isLoading = false
    
    func getProducts() async {
        // API endpoint
        let url = URL(string: "https://sephora.p.rapidapi.com/products/v2/list?number=1&size=10&country=AU&language=en-AU&root_category=skincare")!
        
        guard let apiKey = InfoPlistHandler.getValue(key: "API_KEY") as? String else {
            return
        }
        guard let apiHost = InfoPlistHandler.getValue(key: "API_HOST") as? String else {
            return
        }
        
        var request = URLRequest(url: url)
        // set request header
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(apiHost, forHTTPHeaderField: "X-RapidAPI-Host")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            do {
                // get error message if request unsuccessful
                if (400...499).contains(res.statusCode) {
                    let decodedData = try JSONDecoder().decode(Error.self, from: data)
                    print(decodedData)
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
            }
        }.resume()
    }
    
    var body: some View {
        TabView {
            HomeView(user: user, products: $products, isLoading: $isLoading)
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
        .task {
            isLoading = true
            // await getProducts()
            isLoading = false
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(user: users[1])
    }
}
