//
//  ProductCardView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

// view used for each product listed in HomeView
struct ProductCardView: View {
    var image: String
    var brand: String
    var product: String
    
    // intended layout: product image sits on left, product info on right
    var body: some View {
        HStack(alignment: .center) {
            Image(image) // product image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.all, 20)
            VStack(alignment: .leading) {
                Text(brand) // product brand
                    .foregroundColor(Color("Dark Green"))
                    .padding(.bottom, 1)
                    .font(Font.custom("Avenir", size: 16, relativeTo: .body))
                Text(product) // product name
                    .foregroundColor(Color("Secondary Green"))
                    .bold()
                    .lineLimit(3)
            }
            .padding(.trailing, 20)
            Spacer()
        }
        .background(Color("White"))
        .modifier(CardModifier())   // apply CardModifier styling
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(image: "cerave-hydrating-foaming-oil-cleanser", brand: "CeraVe", product: "Hydrating Foaming Oil Cleanser")
    }
}

// styling for product card
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 2, y: 4)
    }
}
