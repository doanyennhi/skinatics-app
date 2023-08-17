//
//  Checklist.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI


// Checklist item for skin quiz
struct Checklist: View {
    var content: String
    @State var isSelected: Bool = false
    var action: () -> Void

    
    var body: some View {
        HStack {
            Text(content)
            Spacer()
            Checkmark(isChecked: $isSelected)
        }
        // Highlight selected item
        .foregroundColor(isSelected ? Color("Secondary Green") : .black)
        .fontWeight(isSelected ? .bold : .regular)
        .padding(.vertical, 10)
        
        .onTapGesture {
            isSelected.toggle()
            action()
        }
    }
}

//struct Checklist_Previews: PreviewProvider {
//    static var previews: some View {
//        Checklist()
//    }
//}
