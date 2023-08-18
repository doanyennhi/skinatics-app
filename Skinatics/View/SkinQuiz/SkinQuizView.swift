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
    @State var show: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                ScreenTitle(title: "What's your skin type?")
                Text(show ? "Please select at least one item" : "")
                    .foregroundColor(.red)
                    .padding(.top, 5)
                
                // Checklist for skin types
               
                    List(skinTypes, id: \.self) { skinType in
                        CheckItem(content: skinType, isSelected: selectedTypes.contains(skinType)) {
                            toggleItem(list: &selectedTypes, item: skinType)
                            print(selectedTypes)
                        }
                        .listRowBackground(Color("Floral White"))
                }
                    .listStyle(.plain)
                
                NavigationLink {
                    SkinIssuesView()
                } label: {
                    Text("Next")
                }
                .buttonStyle(PrimaryButtonStyle())
                .simultaneousGesture(TapGesture().onEnded {
                    if selectedTypes.isEmpty {
                        show = true
                    }
                })
                .disabled(show)
                
            }
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
            
        }
        
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView()
    }
}
