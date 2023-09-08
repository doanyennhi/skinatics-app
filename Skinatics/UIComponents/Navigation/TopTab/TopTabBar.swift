//
//  TopTabBar.swift
//  Skinatics
//
//  Created by Nhii on 8/9/2023.
//

import SwiftUI

struct TopTabBar: View {
    var tabItems: [String]
    @State var tabSelected: Int
    
    private func onTabSelected(index: Int) {
        withAnimation {tabSelected = index}
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(0 ..< tabItems.count, id: \.self) {index in
                TabBarItem(item: tabItems[index], isSelected: tabSelected == index)
                    .onTapGesture {
                        onTabSelected(index: index)
                    }
            }
        }
    }
}

struct TopTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TopTabBar(tabItems: ["Details", "Reviews", "Ingredients"], tabSelected: 0)
    }
}
