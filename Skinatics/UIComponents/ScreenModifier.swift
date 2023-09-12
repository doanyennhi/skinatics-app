//
//  ScreenModifier.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

struct ScreenModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18, relativeTo: .body))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
    }
}
