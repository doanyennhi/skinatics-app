//
//  View+Extensions.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

extension View {
    
    /// Fade out a view at its top and bottom
    /// @fadeHeight: height of the fade/ blurry effect
    func verticalFadeOut(topHeight: CGFloat, bottomHeight: CGFloat) -> some View {
        return mask(
            VStack(spacing: 0) {
                // fade at top
                LinearGradient(gradient:
                   Gradient(
                       colors: [.black.opacity(0), .black]),
                       startPoint: .top, endPoint: .bottom
                   )
                   .frame(height: topHeight)
                
                Rectangle().fill(Color.black)
                
                // fade at bottom
                LinearGradient(gradient:
                   Gradient(
                       colors: [.black.opacity(0), .black]),
                       startPoint: .bottom, endPoint: .top
                   )
                   .frame(height: bottomHeight)
            }
        )
    }
}
