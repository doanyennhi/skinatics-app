//
//  Carousel.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 18/9/2023.
//

import SwiftUI

struct BannerItem: View {
    var title: String = "Hello world!"
    var icon: String = "arrow.triangle.2.circlepath"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                .fill(Color("AccentColor"))
                .frame(height: 125)
                .padding()
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(Font.custom("Avenir", size: 24, relativeTo: .title))
                    .bold()
                Spacer()
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.horizontal, 45)
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        BannerItem()
    }
}
