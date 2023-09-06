//
//  ProductDetailView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI

struct ProductDetailView: View {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
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
                
                Text(product.desc)
                
                Text("Stores nearby with this product")
                    .foregroundColor(.accentColor)
                    .font(Font.custom("Avenir", size: 20))
                    .bold()
                    .padding(.vertical, 5)
            }
        }
        .modifier(ScreenModifier())
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: products[0])
    }
}
