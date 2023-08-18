//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

struct SkinConditionView: View {
    @State var selected = Set<String>()
    @State var selectedIssues: Set<String>
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ScreenTitle(title: "Any skin conditions?")
                    .padding(.bottom, 5)

                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: twoColumnGrid) {
                        ForEach(conditions, id: \.self) { item in
                            Checkbox(content: item, isSelected: selected.contains(item)) {
                                toggleItem(list: &selected, item: item)
                                print(selected)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                .verticalFadeOut()
                
                Button("Submit", action: {print(selectedIssues)})
                    .buttonStyle(PrimaryButtonStyle())
            }

            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
}

//struct SkinConditionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkinConditionView()
//    }
//}
