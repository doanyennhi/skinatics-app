//
//  TabBarItem.swift
//  Skinatics
//
//  Created by Nhii on 8/9/2023.
//

import SwiftUI

struct TabBarItem: View {
    var item: String
    var isSelected: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            Text(item)
                .font(.custom("Avenir", size: isSelected ? 20 : 18, relativeTo: .title2))
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(Color("Secondary Green"))
            
            Divider()
                .frame(height: isSelected ? 2 : 1)
                .overlay(isSelected ? Color("Secondary Green") : Color.clear)
        }
    }
}

struct TabBarItem_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItem(item: "Details", isSelected: true)
    }
}
