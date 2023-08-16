//
//  SkinQuizView.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

struct SkinQuizView: View {
    var skinTypes: [String] = ["Dry", "Combination", "Oily", "Normal", "Sensitive", "Acne-prone"]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("What's your skin type?").font(.largeTitle)
                .padding(.horizontal, 20)
                .multilineTextAlignment(.center)
                .bold().foregroundColor(Color("Dark Green"))
            
            // Checklist for skin types
            ForEach(skinTypes, id: \.self) { skinType in
                Checkbox(content: skinType)
            }

        }
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Floral White"))
                .foregroundColor(.black)
    }
}

// Define each checkbox item
struct Checkbox: View {
    @State var isSelected = false
    var content: String
    
    var body: some View {
        Toggle(isOn: $isSelected) {
            Text(content)
        }
        .toggleStyle(CustomCheckboxStyle())
    }
}

// Customize toggle style to look like checkbox
struct CustomCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
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
        .padding(.horizontal, 50)
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
