//
//  ProductsView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct ProductsView: View {
    var products: [Product] = productsList
    
    var body: some View {
        List(products) { product in
            ListedProduct(productBrand: "Brand", productImage: product.attributes.imageUrls[0], productName: product.attributes.name)
                .listRowBackground(Color("Floral White"))
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
