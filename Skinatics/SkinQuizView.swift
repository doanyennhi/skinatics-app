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
            
            List(skinTypes, id: \.self) { skinType in
                Checkbox(content: skinType)
            }
        }
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Floral White"))
    }
}

struct Checkbox: View {
    @State var isSelected = false
    var content: String
    
    var body: some View {
        Toggle(isOn: $isSelected) {
            Text(content)
        }
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
