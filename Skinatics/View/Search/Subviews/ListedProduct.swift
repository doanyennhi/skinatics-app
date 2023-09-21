//
//  ListedProduct.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct ListedProduct: View {
    var productBrand: String
    var productImage: String
    var productName: String
    
    var body: some View {
        
        HStack {
            Image(productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(productBrand)
                    .subheading()
                    .padding(.bottom, -18)
                Text(productName)
            }
            .padding(.leading, 7)
        }
    }
}

struct ListedProduct_Previews: PreviewProvider {
    static var previews: some View {
        ListedProduct(productBrand: "The Ordinary.", productImage: "the-ordinary-hyaluronic-acid", productName: "Hyaluronic Acid 2% + B5")
    }
}
