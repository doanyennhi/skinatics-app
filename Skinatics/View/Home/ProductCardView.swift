//
//  ProductCardView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

struct ProductCardView: View {
    
    var image: String
    var brand: String
    var product: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.all, 20)
            VStack(alignment: .leading) {
                Text(brand)
                    .foregroundColor(Color("Dark Green"))
                    .padding(.bottom, 1)
                    .font(.subheadline)
                Text(product)
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                    .bold()
            }
            .padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.white)
        .modifier(CardModifier())
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(image: "cerave-hydrating-foaming-oil-cleanser", brand: "CeraVe", product: "Hydrating Foaming Oil Cleanser")
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 2, y: 4)
    }
}
