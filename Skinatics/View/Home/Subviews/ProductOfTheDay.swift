//
//  ProductOfTheDat.swift
//  Skinatics
//
//  Created by Nhii on 21/9/2023.
//

import SwiftUI

struct ProductOfTheDay: View {
    var product: Product
    
    var body: some View {
        VStack(spacing: 20) {
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
            Text(product.attributes.name)
                .title2().bold()
                .multilineTextAlignment(.center)
            Text(product.attributes.description)
        }
        .padding(.bottom)
    }
}

struct ProductOfTheDat_Previews: PreviewProvider {
    static var previews: some View {
        ProductOfTheDay(product: productsList[1])
    }
}
