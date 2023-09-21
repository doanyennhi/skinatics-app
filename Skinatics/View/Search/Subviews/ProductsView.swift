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
            // need to adjust Product model to house brand name
            Text(product.attributes.name)
        }
        .scrollContentBackground(.hidden)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
