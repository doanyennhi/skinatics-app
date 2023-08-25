//
//  Subheading.swift
//  Skinatics
//
//  Created by Nhii on 24/8/2023.
//

import SwiftUI

// Define common subheading/ subtitle used in screen
struct Subheading: View {
    private var subheading: String
    
    init(subheading: String) {
        self.subheading = subheading
    }
    
    var body: some View {
        Text(subheading)
            .foregroundColor(Color("Secondary Green"))
            .padding(.bottom, 20)
            .multilineTextAlignment(.center)
    }
}

struct Subheading_Previews: PreviewProvider {
    static var previews: some View {
        Subheading(subheading: "Next")
    }
}
