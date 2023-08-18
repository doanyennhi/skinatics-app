//
//  View+Extensions.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

extension View {
    // Fade out a view at its top and bottom
    func verticalFadeOut(fadeLength: CGFloat=50) -> some View {
        return mask(
            VStack(spacing: 0) {

                // Gradient at top
                LinearGradient(gradient:
                   Gradient(
                       colors: [Color.black.opacity(0), Color.black]),
                       startPoint: .top, endPoint: .bottom
                   )
                   .frame(height: fadeLength)
                
                Rectangle().fill(Color.black)
                
                // Gradient at bottom
                LinearGradient(gradient:
                   Gradient(
                       colors: [Color.black.opacity(0), Color.black]),
                       startPoint: .bottom, endPoint: .top
                   )
                   .frame(height: fadeLength)
            }
        )
    }
}
