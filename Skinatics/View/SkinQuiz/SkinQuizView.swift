//
//  SkinQuizView.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

// skin type options
var skinTypes: [String] = ["Dry", "Combination", "Oily", "Normal", "Sensitive", "Acne-prone"]

// First quiz, quiz on skin types
struct SkinQuizView: View {
    // store selected values
    @State var selectedTypes = Set<String>()
    // track if display error message
    @State var show: Bool = false
    @State var user: User      // current user
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                ScreenTitle(title: "What's your skin type?")
                    .multilineTextAlignment(.center)
                ErrorText(show: $show, text: "Please select at least one item")
                
                // Checklist for skin types
                    List(skinTypes, id: \.self) { skinType in
                        CheckItem(content: skinType, isSelected: selectedTypes.contains(skinType)) {
                            toggleItem(set: &selectedTypes, item: skinType)
                            print(selectedTypes)
                        }
                        .listRowBackground(Color("Floral White"))
                }
                    .listStyle(.plain)
                
                NavigationLink(destination: SkinIssuesView(user: user)) {
                    Text("Next")
                }
                .buttonStyle(PrimaryButtonStyle())
                // prevent navigation if no options selected
                .disabled(selectedTypes.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                    // show error message if no options selected
                    if selectedTypes.isEmpty {
                        show = true
                    } else {
                        show = false
                        // add selected options to user data
                        user.skinTypes = selectedTypes
                    }
                })
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
        SkinQuizView(user: User())
    }
}
