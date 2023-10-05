//
//  SkinaticsWidgetLargeView.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI

struct SkinaticsWidgetLargeView: View {
    var entry: SkinaticsEntry

    var body: some View {
        ZStack {
            Color("WidgetBackground")
            VStack() {
               Text("Today's Product")
                    .fontWeight(.semibold)
                AsyncImage(url: URL(string: entry.productImg)) { phase in
                    if let img = phase.image {
                        img.resizable()
                            .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } else if phase.error != nil {
                        Image("placeholder")
                            .resizable()
                            .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    } else {
                        ProgressView()
                            .padding(.bottom)
                    }
                }
                HStack(alignment: .top) {
                        Text(entry.productName)
                            .bold()
                            .foregroundColor(Color("Green"))
                            .lineLimit(2)
                        Spacer()
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(entry.productRating.formatted())")
                        Image(systemName: "star.fill")
                    }
                    .font(Font.custom("Avenir", size: 18))
                    }
            }
            .font(Font.custom("Avenir", size: 20))
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
        }
        }
}

struct SkinaticsWidgetLargeView_Previews: PreviewProvider {
    static var previews: some View {
        SkinaticsWidgetLargeView(entry: SkinaticsEntry(date: Date(), productName: "Hyaluronic Acid 2% + B5", productImg: "", productRating: 4.2))
    }
}
