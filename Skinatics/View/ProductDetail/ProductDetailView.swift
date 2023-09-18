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
    @State var productTabSelected: Int = 0
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Image(product.attributes.imageUrls[0])
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("CeraVe")
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
                            Text(product.attributes.description)
                        case 1:
                            Text(product.attributes.benefits)
                        case 2:
                            Text(product.attributes.ingredients)
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
                }
            }
            .modifier(ScreenModifier())
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: productsList[0])
    }
}
