//
//  Heading2.swift
//  Skinatics
//
//  Created by Nhii on 8/9/2023.
//

import SwiftUI

struct ResultSection: View {
    var heading: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(heading)
                .foregroundColor(.accentColor)
                .font(Font.custom("Avenir", size: 20))
                .fontWeight(.semibold)
            .italic()
            
            Text(content)
        }
    }
}

struct Heading2_Previews: PreviewProvider {
    static var previews: some View {
        ResultSection(heading: "Radiance", content: "We’re not seeing a change here yet. We recommend getting some good sleep every night and finding a product with vitamin C to help even out uneven skin tone.")
    }
}
