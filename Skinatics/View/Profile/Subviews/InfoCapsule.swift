//
//  InfoCapsule.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

struct InfoCapsule: View {
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(Color("White"))
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Capsule()).foregroundColor(Color.accentColor)
        }
    }
}

struct InfoCapsule_Previews: PreviewProvider {
    static var previews: some View {
        InfoCapsule(text: "Rin Itoshi")
    }
}
