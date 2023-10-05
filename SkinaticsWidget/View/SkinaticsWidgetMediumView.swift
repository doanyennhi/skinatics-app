//
//  SkinaticsWidgetMediumView.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI

struct SkinaticsWidgetMediumView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            
            GeometryReader { geometry in
                VStack() {
                    HStack() {
                        AsyncImage(url: URL(string: entry.productImg)) { phase in
                            if let img = phase.image {
                                img.resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width * 0.45, height: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            } else if phase.error != nil {
                                Image("placeholder")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width * 0.45, height: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            } else {
                                ProgressView()
                                    .padding()
                            }
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Today's Product")
                                .fontWeight(.semibold)
                            Text(entry.productName)
                                .bold()
                                .foregroundColor(Color("Green"))
                                .lineLimit(2)
                            HStack(alignment: .firstTextBaseline) {
                                Text("\(entry.productRating.formatted())")
                                Image(systemName: "star.fill")
                            }
                            .font(Font.custom("Avenir", size: 18))
                        }
                        .padding(.horizontal, 10)
                    }
                }
                .font(Font.custom("Avenir", size: 20))
            }
        }
        }
}

struct SkinaticsWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetMediumView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2))
    }
}
