//
//  InfoSheetView.swift
//  Skinatics
//
//  Created by Nhii on 10/9/2023.
//

import SwiftUI

struct ResultInfo: Hashable {
    var section: String
    var icon: String
    var desc: String
}

let resultInfo = [
    ResultInfo(section: "Radiance", icon: "sparkles", desc: "Radiant skin appears to be refreshed an energised, with a noticeable reduction in the appearance of fatigue and dullness. \n\nCertain skincare ingredients, such as vitamin C, niacinamide, and hyaluronic acid, can help improve skin radiance. Vitamin C, for instance, is known for its ability to brighten the skin and reduce the appearance of discolouration."),
    
    ResultInfo(section: "Hydration", icon: "drop.fill", desc: "Texture refers to one’s skin surface in terms of smoothness and evenness. \n\nVarious skincare ingredients, such as retinoids, alpha hydroxy acids (AHAs), and vitamin C, are often used to target specific concerns related to skin texture. These ingredients can aid in promoting collagen production, reducing the appearance of fine lines and wrinkles, and minimising the size of pores, resulting in a more refined and smoother skin texture."),
    
    ResultInfo(section: "Texture", icon: "square.grid.3x1.below.line.grid.1x2.fill", desc: "Texture refers to one’s skin surface in terms of smoothness and evenness. \n\nVarious skincare ingredients, such as retinoids, alpha hydroxy acids (AHAs), and vitamin C, are often used to target specific concerns related to skin texture. These ingredients can aid in promoting collagen production, reducing the appearance of fine lines and wrinkles, and minimising the size of pores, resulting in a more refined and smoother skin texture."),
    
    ResultInfo(section: "Lines", icon: "water.waves", desc: "Lines refer to visible lines, wrinkles, and creases that appear on the skin's surface due to aging and repeated facial expressions. \n\nTo minimise wrinkles and lines using skincare, protect your skin with daily SPF, ensure ample hydration, and incorporate retinoids to boost collagen. Antioxidant-rich products, like vitamin C and E, counter oxidative stress, while peptides stimulate collagen production. Hyaluronic acid adds moisture and plumpness. Choose gentle cleansers, exfoliate cautiously for improved texture, and lead a healthy lifestyle with balanced nutrition, hydration, sleep, and stress management.")
]

struct InfoSheetView: View {
    var section: String
    var yay: Void {
        print(section)
    }
    
    var body: some View {
        VStack {
            ForEach(resultInfo, id: \.self) { info in
                if section == info.section {
                    ScreenTitle(title: info.section)
                    Image(systemName: info.icon)
                        .font(.system(size: 50))
                        .padding(.bottom, 20)
                    Text(info.desc)
                }
            }
        }
        .modifier(ScreenModifier())
    }
}

struct InfoSheetView_Previews: PreviewProvider {
    static var previews: some View {
        InfoSheetView(section: "Hydration")
    }
}
