//
//  RoutineView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct RoutineView: View {
    @State var tabSelected: Int = 0
    
    var nightCheckListData: [CheckListItem] = [
        CheckListItem(id: 0, isChecked: false, title: "Oil-based makeup remover", description: "Once applied, massage in until skin is clean, then rinse with water."),
        CheckListItem(id: 1, isChecked: false, title: "Water-based cleaner", description: "Apply it to wet skin, massage in, and rinse off."),
        CheckListItem(id: 2, isChecked: false, title: "Toner", description: "Apply the product to a cotton pad and swipe over the skin, or apply directly to face using hands."),
        CheckListItem(id: 3, isChecked: false, title: "Spot Treatment", description: "Dab a thin layer over your spot and wait a full minute for it to dry.")
    ]
    var dayCheckListData: [CheckListItem] = [
        CheckListItem(id: 0, isChecked: false, title: "Oil-based makeup remover", description: "Once applied, massage in until skin is clean, then rinse with water."),
        CheckListItem(id: 1, isChecked: false, title: "Water-based cleaner", description: "Apply it to wet skin, massage in, and rinse off."),
        CheckListItem(id: 2, isChecked: false, title: "Toner", description: "Apply the product to a cotton pad and swipe over the skin, or apply directly to face using hands.")
    ]
    
    var body: some View {
        VStack {
            Text("Skincare Routine")
                .largeTitle(multilineCenter: true)
            
            TopTabBar(tabItems: ["Morning", "Night"], tabSelected: $tabSelected)
                .padding(.vertical, 15)
            
            VStack {
                switch tabSelected {
                case 0:
                    ScrollView {
                        VStack {
                            ForEach(dayCheckListData, id:\.id) { item in
                                CheckListBox(isChecked: item.isChecked, item: item)
                            }
                        }
                        .padding(.all, 8)
                    }
                case 1:
                    ScrollView {
                        VStack {
                            ForEach(nightCheckListData, id:\.id) { item in
                                CheckListBox(isChecked: item.isChecked, item: item)
                            }
                        }
                        .padding(.all, 8)
                    }
                default: EmptyView()
                }
            }
            .padding(.bottom, 20)
        }
        .modifier(ScreenModifier())
    }
}

struct RoutineView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineView()
    }
}
