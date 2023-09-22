//
//  ProductDetailView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//  Image by storyset on Freepik
// https://www.freepik.com/free-vector/curiosity-search-concept-illustration_30590326.htm#query=cannot%20find&position=33&from_view=search&track=ais
//

import SwiftUI

let stores = [Store(image: "sephora", name: "Sephora Melbourne Central", address: "Shop 103/211 La Trobe St, Melbourne VIC 3000"), Store(image: "mecca", name: "Mecca Melbourne Central", address: "Ground Level, 211 La Trobe St, Melbourne VIC 3000"),  Store(image: "kimbao", name: "Kim Bao Beauty", address: "183-185 Elizabeth St, Melbourne VIC 3000")]

struct ProductDetailView: View {
    @State private var product: Product?
    private var productId: String
    @State var productTabSelected: Int = 0
    @State var isLoading: Bool = false
    
    init(productId: String) {
        self.productId = productId
    }
    
    func getProduct() async {
        isLoading = true
        guard let request = setRequestHeader(link: "https://sephora.p.rapidapi.com/products/v2/detail?id=\(productId)&country=AU&language=en-AU") else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            do {
                // get error message if request unsuccessful
                if (400...499).contains(res.statusCode) {
                    let decodedData = try JSONDecoder().decode(Error.self, from: data)
                    print(decodedData)
                    isLoading = false
                } else {
                    // decode data
                    let decodedData = try JSONDecoder().decode(ProductDetail.self, from: data)
                    
                    // send task back to main thread
                    DispatchQueue.main.async {
                        self.product = decodedData.data
                        isLoading = false
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        if isLoading {
                            ProgressView()
                                .controlSize(.large)
                        } else {
                            if let product = product {
                                AsyncImage(url: URL(string: product.attributes.imageUrls[0])) { phase in
                                    if let img = phase.image {
                                        img.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    } else if phase.error != nil {
                                        Image("placeholder")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                    } else {
                                        ProgressView()
                                    }
                                }
                                
                                HStack(alignment: .firstTextBaseline) {
                                    Text(product.attributes.brand ?? "")
                                        .title2()
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    Text("\(product.attributes.rating.formatted())")
                                        .underline()
                                    Image(systemName: "star.fill")
                                }
                                .foregroundColor(Color("Secondary Green"))
                                
                                Text(product.attributes.name)
                                    .title()
                                    .multilineTextAlignment(.center)
                                
                                TopTabBar(tabItems: ["Details", "Benefits","Ingredients"], tabSelected: $productTabSelected)
                                    .padding(.vertical, 15)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    switch productTabSelected {
                                    case 0:
                                        Text(product.attributes.description.stripHTML())
                                    case 1:
                                        Text(product.attributes.benefits.stripHTML())
                                    case 2:
                                        Text(product.attributes.ingredients.stripHTML())
                                        NavigationLink(destination: IngredientDictView(ingredients: ingredients), label: {
                                            Text("Benefits of main ingredients")
                                                .underline()
                                            Image(systemName: "chevron.right")
                                        })
                                    default: EmptyView()
                                    }
                                }
                                .padding(.bottom, 20)
                                
                                Text("Stores nearby with this product")
                                    .title2()
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                ScrollView(.horizontal) {
                                    HStack(alignment: .top, spacing: 30) {
                                        ForEach(stores) { store in
                                            StoreCard(store: store)
                                        }
                                    }
                                    .padding(.bottom, 10)
                                }
                            } else {
                                NoResultView(text: "Sorry, we cannot find the product you are looking for!")
                            }
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(minHeight: geometry.size.height)
                }
                .modifier(ScreenModifier())
                .task {
                    await getProduct()
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productId: "")
    }
}
