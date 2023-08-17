//
//  Checkmark.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

struct Checkmark: View {
    @Binding var isChecked: Bool
    
    var body: some View {
        // Show green tick mark if selected
        Image(systemName: isChecked ? "checkmark.circle.fill": "circle")
            .foregroundColor(isChecked ? Color("Secondary Green") : .gray)
            .font(.system(size: 20))
    }
}
