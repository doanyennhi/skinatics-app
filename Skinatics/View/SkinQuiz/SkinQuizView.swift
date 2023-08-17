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
        NavigationStack {
            VStack(alignment: .center) {
                ScreenTitle(title: "What's your skin type?")
                
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
                
                NavigationLink(destination: SkinIssuesView()) {
                    NavigationButton()
                }
                
            }
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
            .foregroundColor(.black)
            
        }
        
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
