//
//  ProductDetailView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI

let stores = [Store(image: "sephora", name: "Sephora Melbourne Central", address: "Shop 103/211 La Trobe St, Melbourne VIC 3000"), Store(image: "mecca", name: "Mecca Melbourne Central", address: "Ground Level, 211 La Trobe St, Melbourne VIC 3000"),  Store(image: "kimbao", name: "Kim Bao Beauty", address: "183-185 Elizabeth St, Melbourne VIC 3000")]

struct ProductDetailView: View {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Image(product.image)
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text(product.brand)
                            .foregroundColor(.accentColor)
                            .font(Font.custom("Avenir", size: 20))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Text(String(product.rating))
                            .foregroundColor(.accentColor)
                            .underline()
                        Image(systemName: "star.fill")
                            .foregroundColor(.accentColor)
                    }
                    
                    Text(product.product)
                        .foregroundColor(Color("Dark Green"))
                        .font(Font.custom("Avenir", size: 24))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        
                    TopTabBar(tabItems: ["Details", "Reviews", "Ingredients"], tabSelected: 0)
                    Text(product.desc)
                    
                    Text("Stores nearby with this product")
                        .foregroundColor(.accentColor)
                        .font(Font.custom("Avenir", size: 20))
                        .bold()
                        .padding(.vertical, 5)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top, spacing: 30) {
                            ForEach(stores) { store in
                                StoreCard(store: store)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            .modifier(ScreenModifier())
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: products[0])
    }
}
