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
            .font(Font.custom("Avenir", size: 32))
            .padding(.vertical, 10)
            .fontWeight(.black).foregroundColor(Color("Dark Green"))
    }
}

struct ScreenTitle_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTitle(title: "Screen")
    }
}
