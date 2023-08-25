//
//  HomeView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

struct Product: Identifiable {
    var id = UUID().uuidString
    var image: String
    var brand: String
    var product: String
}

var products: [Product] = [
    Product(image: "cerave-hydrating-foaming-oil-cleanser", brand: "CeraVe", product: "Hydrating Foaming Oil Cleanser")
]

struct HomeView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hey Jane!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("Dark Green"))
                
                Text("We have some recommendations for you.")
                    .foregroundStyle(Color("AccentColor"))
            }
            .padding(.bottom, 20)
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(products) {
                        product in ProductCardView(image: product.image, brand: product.brand, product: product.product)
                }
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
            }

                }
            
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Floral white"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
