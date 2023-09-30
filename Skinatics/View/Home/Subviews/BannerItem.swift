//
//  Carousel.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 18/9/2023.
//

import SwiftUI

struct BannerDetail: Identifiable {
    var id: Int
    var title: String
    var icon: String
    var view: AnyView
    var tabItem: TabItem?
}

struct BannerItem: View {
    var detail: BannerDetail
    
    var body: some View {
        NavigationLink(destination: detail.view) {
            ZStack {
                    RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                        .fill(Color("AccentColor"))
                        .frame(height: 125)
                        .padding()
                    HStack {
                        Text(detail.title)
                            .foregroundColor(.white)
                            .font(Font.custom("Avenir", size: 24, relativeTo: .title))
                            .bold()
                        Spacer()
                        Image(systemName: detail.icon)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.horizontal, 45)
            }
        }
        .disabled((detail.tabItem != nil))
        }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        BannerItem(detail: banners[0])
    }
}
