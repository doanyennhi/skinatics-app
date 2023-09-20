//
//  RecommendedCard.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 18/9/2023.
//

import SwiftUI

// view used for each recommended product listed in HomeView
struct RecommendedCard: View {
    var product: Product = productsList[1]
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.attributes.imageUrls[0])) { phase in
                if let img = phase.image {
                    img.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 175)
                        .padding(.bottom, 5)
                } else if phase.error != nil {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 175)
                        .padding(.bottom, 5)
                } else {
                    ProgressView()
                }
            }
            VStack(alignment: .leading) {
                Text("Brand")
                    .foregroundColor(Color("Dark Green"))
                    // .padding(.bottom, 1)
                    .font(Font.custom("Avenir", size: 16, relativeTo: .body))
                Text(product.attributes.name)
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
