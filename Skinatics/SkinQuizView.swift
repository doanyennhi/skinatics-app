//
//  SkinQuizView.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

var skinTypes: [String] = ["Dry", "Combination", "Oily", "Normal", "Sensitive", "Acne-prone"]

struct SkinQuizView: View {
    // store selected values
    @State var selectedTypes = Set<String>()
    
    var body: some View {
        VStack(alignment: .center) {
            Text("What's your skin type?").font(.largeTitle)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
                .bold().foregroundColor(Color("Dark Green"))
            
            Spacer()
            
            // Checklist for skin types
            ForEach(skinTypes, id: \.self) { skinType in
                Checkbox(content: skinType, isSelected: selectedTypes.contains(skinType)) {
                    // add/ remove item when button is tapped
                    // remove if item is already selected, otherwise add it
                    if (selectedTypes.contains(skinType)) {
                        selectedTypes.remove(skinType)
                    } else {
                        selectedTypes.insert(skinType)
                    }
                    print(selectedTypes)
                }
            }
            
            Spacer()
            PrimaryButton(title: "Next", action: {print("Hello")})

        }
        .padding(.horizontal, 30)
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Floral White"))
                .foregroundColor(.black)
    }
}

// Define each checkbox item
struct Checkbox: View {
    var content: String
    @State var isSelected: Bool = false
    var action: () -> Void
    
    var body: some View {
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
            HStack {
                configuration.label
                Spacer()
                
                Image(systemName: configuration.isOn ? "checkmark.circle.fill": "circle")
                    .foregroundColor(configuration.isOn ? Color("Secondary Green") : .gray)
                    .font(.system(size: 20))
            }
            .padding(25)
            
            // Highlight selected item
            .background(configuration.isOn ? Color("Light Green").opacity(0.2) : .white)
        })
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 4)
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
