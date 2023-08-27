//
//  SectionTitle.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

struct SectionTitle: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color("Dark Green"))
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle(title: "Title")
    }
}
