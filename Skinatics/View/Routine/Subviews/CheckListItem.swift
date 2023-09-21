//
//  CheckListItem.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct CheckListBox: View {
    @State var isChecked: Bool = false
    func toggle() {isChecked = !isChecked}
    var item: CheckListItem = CheckListItem(id: 0, isChecked: false, title: "Title", description: "Description")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 0)
                //.frame(height: 125)
            Button(action: toggle) {
                HStack(alignment: .center) {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .title()
                            .padding(.bottom, 1)
                        Text(item.description)
                    }
                    .padding(.leading, 15)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 25)
            }
        }
    }
}

struct CheckListBox_Previews: PreviewProvider {
    static var previews: some View {
        CheckListBox()
    }
}

struct CheckListItem: Identifiable {
    var id: Int
    var isChecked: Bool
    var title: String
    var description: String
}
