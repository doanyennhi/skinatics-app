//
//  SkinaticsWidgetMediumView.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI
import WidgetKit

struct SkinaticsWidgetMediumView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            
            GeometryReader { geometry in
                VStack() {
                    HStack() {
                        RemoteImage(url: URL(string: entry.productImg), screenWidth: geometry.size.width)

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Product For You")
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
                .foregroundColor(Color("Black"))
                .font(Font.custom("Avenir", size: 20))
            }
        }
        }
}

struct SkinaticsWidgetMediumView_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetMediumView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
