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
    @State var isSelected: Bool = false
    var action: () -> Void

    
    var body: some View {
        Toggle(content, isOn: $isSelected)
            .toggleStyle(CustomChecklistStyle(action: action))
    }
}

// Customize toggle style to look like checkbox
struct CustomCheckboxStyle: ToggleStyle {
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
            action()
            print("selected \(configuration.isOn)")
        }, label: {
            HStack {
                configuration.label
                Spacer()
                
                Checkmark(isChecked: configuration.$isOn)
            }
            .padding(25)
            
            // Highlight selected item
            .background(configuration.isOn ? Color("Light Green").opacity(0.2) : .white)
            .foregroundColor(.black)
        })
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 4)
    }
}

struct CustomChecklistStyle: ToggleStyle {
    var action: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
            action()
            print("selected \(configuration.isOn)")
        }, label: {
            VStack {
                HStack {
                    configuration.label
                    Spacer()
                    
                    Checkmark(isChecked: configuration.$isOn)
                }
                // Highlight selected item
                .foregroundColor(configuration.isOn ? Color("Secondary Green") : .black)
                .fontWeight(configuration.isOn ? .bold : .regular)
                .padding(.vertical, 10)
            }
        }
            )
    }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
        Checkbox(content: "Itoshi Rin", action: {})
    }
}
