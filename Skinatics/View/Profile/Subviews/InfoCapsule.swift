//
//  InfoCapsule.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

// Define info displayed in capsule style
struct InfoCapsule: View {
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(Color("White"))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Capsule()).foregroundColor(Color("Secondary Green"))
                .font(Font.custom("Avenir", size: 18))
        }
    }
}

struct InfoCapsule_Previews: PreviewProvider {
    static var previews: some View {
        InfoCapsule(text: "Rin Itoshi")
    }
}
