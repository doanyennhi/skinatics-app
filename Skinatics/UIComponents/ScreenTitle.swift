//
//  ScreenTitle.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

/// Define heading of screen
struct ScreenTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .padding(.horizontal, 20)
            .multilineTextAlignment(.center)
            .bold().foregroundColor(Color("Dark Green"))
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle(title: "Screen")
    }
}
