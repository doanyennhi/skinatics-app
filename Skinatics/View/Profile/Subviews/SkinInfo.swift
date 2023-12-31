//
//  SkinInfo.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

// Display all skin options selected by user
struct SkinInfo: View {
    var title: String
    var items: [String]
    @Binding var isLoading: Bool
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                // title of info
                Text(title)
                    .font(Font.custom("Avenir", size: 22))
                    .italic()
                    .padding(.top, 10)
                
                // list of skin info
                if !items.isEmpty {
                    if !isLoading {
                        HStack {
                            ForEach(items, id: \.self) {item in
                                InfoCapsule(text: item)
                            }
                        }
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                } else {
                    // display if no info
                    Text("No options selected")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SkinInfo_Previews: PreviewProvider {
    static var previews: some View {
        SkinInfo(title: "Skin Type", items: ["Dry", "Acne-prone"], isLoading: .constant(false))
    }
}
