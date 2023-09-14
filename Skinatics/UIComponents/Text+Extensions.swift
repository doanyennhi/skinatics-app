//
//  ScreenTitle.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

extension Text {
    func largeTitle(multilineCenter: Bool) -> some View {
        self
            .font(Font.custom("Avenir", size: 32))
            .padding(.vertical, 10)
            .fontWeight(.black).foregroundColor(Color("Dark Green"))
            .multilineTextAlignment(multilineCenter ? .center : .leading)
    }
    
    func title() -> some View {
        self
            .foregroundColor(Color("Dark Green"))
            .font(Font.custom("Avenir", size: 24, relativeTo: .title))
            .bold()
    }
    
    func title2() -> some View {
        self
            .font(Font.custom("Avenir", size: 20, relativeTo: .title2))
            .foregroundColor(Color("Secondary Green"))
    }
    
    func subheading() -> some View {
        self
            .foregroundColor(Color("Secondary Green"))
            .padding(.bottom, 20)
            .multilineTextAlignment(.center)
    }
}
