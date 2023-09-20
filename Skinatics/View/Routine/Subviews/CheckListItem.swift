//
//  CheckListItem.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct CheckListBox: View {
    var item: CheckListItem = CheckListItem(title: "Water-based cleanser", description: "Apply it to wet skin, massage in, and then rinse off.")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
                .frame(height: 125)
            HStack {
                // place checklist ticker here
                VStack(alignment: .leading) {
                    Text(item.title)
                        .title()
                        .padding(.bottom, 1)
                    Text(item.description)
                }
            }
        }
    }
}

struct CheckListBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckListBox()
    }
}

struct CheckListItem {
    var isChecked: Bool = false
    var title: String
    var description: String
}
