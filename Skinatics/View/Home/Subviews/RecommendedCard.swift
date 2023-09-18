//
//  RecommendedCard.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 18/9/2023.
//

import SwiftUI

// view used for each recommended product listed in HomeView
struct RecommendedCard: View {
    var product: Product = Product(image: "the-ordinary-hyaluronic-acid", brand: "The Ordinary.", product: "Hyaluronic Acid 2% + B5", rating: 3.5, desc: "Hyaluronic Acid 2% + B5 is a water-based formula combining low-, medium- and high-molecular-weight hyaluronic acid molecules and a next-generation HA crosspolymer to support hydration to multiple layers of your skin. It also targets the appearance of wrinkles and textural irregularities. Plus, it uses pro-vitamin B5 to enhance hydration at the outer layers, resulting in smoother, plumper skin.", ingredients: "Aqua (Water), Sodium Hyaluronate, Pentylene Glycol, Propanediol, Sodium Hyaluronate Crosspolymer, Panthenol, Ahnfeltia Concinna Extract, Glycerin, Trisodium Ethylenediamine Disuccinate, Citric Acid, Isoceteth-20, Ethoxydiglycol, Ethylhexylglycerin, Hexylene Glycol, 1,2-Hexanediol, Phenoxyethanol, Caprylyl Glycol")
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 175)
                .padding(.bottom, 5)
            VStack(alignment: .leading) {
                Text(product.brand)
                    .foregroundColor(Color("Dark Green"))
                    // .padding(.bottom, 1)
                    .font(Font.custom("Avenir", size: 16, relativeTo: .body))
                Text(product.product)
                    .foregroundColor(Color("AccentColor"))
                    .bold()
                    .lineLimit(3)
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 5)
            Spacer()
        }
        .background(.white)
        .modifier(CardModifier())
    }
}

// styling for product card
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            //.shadow(color: Color.black.opacity(0.2), radius: 7, x: 2, y: 0)
            .frame(width: 175, height: 300)
    }
}

struct RecommendedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCard()
    }
}
