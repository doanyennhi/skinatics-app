//
//  OptionList.swift
//  Skinatics
//
//  Created by Nhii on 19/8/2023.
//

import SwiftUI

struct OptionGrid: View {
    // define grid structure
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var options: [String]
    @State var selectedOptions = Set<String>()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: twoColumnGrid) {
                ForEach(options, id: \.self) { item in
                    Checkbox(content: item, isSelected: selectedOptions.contains(item)) {
                        toggleItem(list: &selectedOptions, item: item)
                        print(selectedOptions)
                    }
                }
            }
            .padding(.vertical, 20)
        }
        .verticalFadeOut()
    }
}

//struct OptionList_Previews: PreviewProvider {
//    static var previews: some View {
//        OptionList()
//    }
//}
