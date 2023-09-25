//
//  Checklist.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI


// Checklist item for skin quiz
struct CheckItem: View {
    var content: String
    @State var isSelected: Bool = false
    var action: () -> Void       // action performed when item is tapped

    var body: some View {
        VStack {
            HStack {
                Text(content)
                Spacer()
                // Show green tick mark if selected
                Image(systemName: isSelected ? "checkmark.circle.fill": "circle")
                    .foregroundColor(isSelected ? Color("Secondary Green") : .gray)
            }
            .padding(.vertical, 30)
            Divider()
        }
        // Highlight selected item
        .foregroundColor(isSelected ? Color("Secondary Green") : Color("Black"))
        .fontWeight(isSelected ? .bold : .regular)
        .padding(.horizontal, 20)
        .contentShape(Rectangle())
        .onTapGesture {
            isSelected.toggle()
            action()
        }
    }
}

struct CheckItem_Previews: PreviewProvider {
    static var previews: some View {
        CheckItem(content: "Itoshi Rin", action: {})
    }
}
