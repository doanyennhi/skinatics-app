//
//  ScreenTitle.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

/// Define heading of screen
struct ScreenTitle: View {
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            .multilineTextAlignment(.center)
            .bold().foregroundColor(Color("Dark Green"))
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle(title: "Screen")
    }
}
