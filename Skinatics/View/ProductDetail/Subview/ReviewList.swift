//
//  Review.swift
//  Skinatics
//
//  Created by Nhii on 9/9/2023.
//

import SwiftUI

let reviews = [Review(reviewer: "Itoshi Rin", rating: 5.0, comment: "The product was very effective, I can see the results after 2 months. Will keep buying!"), Review(reviewer: "Itoshi Sae", rating: 3.5, comment: "It was a bit itchy on my skin, only tried for 2 weeks though so it may get better. Honestly not worth it if your skin is sensitive.")]

struct ReviewList: View {
    var reviews: [Review]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(reviews) { review in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(review.reviewer)
                            .padding(.trailing, 30)
                            .bold()
                        Text("\(review.rating, specifier: "%.1f")")
                        Image(systemName: "star.fill")
                    }
                    .foregroundColor(Color("Dark Green"))
                    Text(review.comment)
                }
            }
            Text("View More")
                .underline()
                .foregroundColor(Color("Secondary Green"))
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList(reviews: reviews)
    }
}
