//
//  SkinaticsWidgetLargeView.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI
import WidgetKit

struct SkinaticsWidgetLargeView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            VStack() {
               Text("Product For You")
                    .fontWeight(.semibold)
                
                RemoteImage(url: URL(string: entry.productImg))
                
                HStack(alignment: .top) {
                    Text(entry.productName)
                        .bold()
                        .foregroundColor(Color("Green"))
                    Spacer()
                    
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(entry.productRating.formatted())")
                            Image(systemName: "star.fill")
                        }
                    .font(Font.custom("Avenir", size: 16))
                    }
                .frame(alignment: .leading)
                .padding(.bottom, 5)
                Text("Our #1 product worldwide + cult favorite, this clinically proven gentle leave-on exfoliant with salicylic acid quickly unclogs pores, smooths wrinkles & evens skin tone.")
                    .font(Font.custom("Avenir", size: 16))
                    .lineLimit(3)
            }
            .foregroundColor(Color("Black"))
            .font(Font.custom("Avenir", size: 18))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        }
}

struct SkinaticsWidgetLargeView_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetLargeView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
