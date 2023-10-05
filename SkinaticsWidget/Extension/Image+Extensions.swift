//
//  Image+Extensions.swift
//  SkinaticsWidgetExtension
//
//  Created by Nhii on 5/10/2023.
//

import SwiftUI

extension Image {
    func smallWidgetModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
   }
    
    func mediumWidgetModifier(screenWidth: Double) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: screenWidth < 0 ? nil : screenWidth * 0.45, height: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 15))
   }
    
    func largeWidgetModifier() -> some View {
        self
            .resizable()
            .aspectRatio(CGSize(width: 5, height: 4), contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))
   }
}
