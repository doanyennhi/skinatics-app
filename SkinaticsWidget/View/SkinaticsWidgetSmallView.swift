//
//  SkinaticsWidgetSmallView.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI
import WidgetKit

struct SkinaticsWidgetSmallView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
//            VStack() {
//                    Image(entry.productImg)
//                        .resizable()
//                        .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
//                        .clipShape(RoundedRectangle(cornerRadius: 15))
//                    Text(entry.productName)
//                        .padding(10)
//                        .background(Color("Green").opacity(0.8))
//                        .foregroundColor(.white)
//                        .bold()
//                        .cornerRadius(15)
//                        .lineLimit(1)
//                        .padding([.bottom, .horizontal], 5)
//                }
//                .padding(10)
            
            ZStack(alignment: .bottom) {
                RemoteImage(url: URL(string: entry.productImg))
                
//                AsyncImage(url: URL(string: entry.productImg)) { phase in
//                    if let img = phase.image {
//                        img.resizable()
//                            .scaledToFit()
//                    } else if phase.error != nil {
//                        Image("placeholder")
//                            .resizable()
//                            .scaledToFit()
//                    } else {
//                        ProgressView()
//                            .padding()
//                    }
//                }
                        
                    Text(entry.productName)
                        .padding(10)
                       .background(Color("Green").opacity(0.8))
                        .foregroundColor(Color("White"))
                        .font(Font.custom("Avenir", size: 14))
                        .bold()
                        .cornerRadius(15)
                        .lineLimit(1)
                        .padding([.bottom, .horizontal], 5)
                }
        }
        }
}

struct SkinaticsWidgetSmallView_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetSmallView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2, productDesc: "Our #1 product worldwide + cult favorite, this clinically proven gentle leave-on exfoliant with salicylic acid quickly unclogs pores, smooths wrinkles & evens skin tone."))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
