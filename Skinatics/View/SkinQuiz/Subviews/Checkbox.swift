//
//  Checkbox.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

// Define each checkbox item
struct Checkbox: View {
    var content: String
    // track if item is chosen
    @State var isSelected: Bool = false
    var action: () -> Void      // action performed when tapped

    
    var body: some View {
        // Use toggle as checkbox
        Toggle(content, isOn: $isSelected)
            .toggleStyle(CustomCheckboxStyle(action: action))
    }
}

// Customize toggle style to look like checkbox
struct CustomCheckboxStyle: ToggleStyle {
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
            action()
        }, label: {
            VStack {
                configuration.label
            }
            .padding(20)
            .frame(maxWidth: .infinity, minHeight:100)
            
            // Selected item is highlighted
            .background(configuration.isOn ? Color("Light Green").opacity(0.2) : .white)
            .foregroundColor(.black)
        })
        .cornerRadius(15)
        .padding(.bottom, 10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 2, y: 4)
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(content: "Itoshi Rin", action: {})
    }
}
