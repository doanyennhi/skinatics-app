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
        NavigationLink(destination: ProductDetailView(productId: product.id)) {
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
                VStack(alignment: .leading, spacing: 5) {
                    HStack(alignment: .firstTextBaseline, spacing: 5) {
                        Text("\(product.attributes.rating.formatted())")
                        Image(systemName: "star.fill")
                    }
                        .font(Font.custom("Avenir", size: 16, relativeTo: .body))
                        .foregroundColor(Color("Black"))
                    Text(product.attributes.name)
                        .foregroundColor(Color("AccentColor"))
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 5)
                Spacer()
            }
            .background(Color("White"))
            .modifier(CardModifier())
        }
    }
}

// styling for product card
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(15)
            .frame(width: 175, height: 300)
    }
}

struct RecommendedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCard()
    }
}
