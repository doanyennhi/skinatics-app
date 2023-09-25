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
    @EnvironmentObject var authenticator: Authenticator
    @State var user = User()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        Text("What's your skin type?").largeTitle(multilineCenter: true)
                        ErrorText(show: $show, text: "Please select at least one item")
                        
                        // Checklist for skin types
                            ForEach(skinTypes, id: \.self) { skinType in
                                CheckItem(content: skinType, isSelected: selectedTypes.contains(skinType)) {
                                    toggleItem(set: &selectedTypes, item: skinType)
                                    print(selectedTypes)
                                }
                            }
                        
                        NavigationLink(destination: SkinIssuesView(user: user)) {
                            Text("Next")
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        .padding(.top)
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
                    .frame(minHeight: geometry.size.height)
                }
                .modifier(ScreenModifier())
            }
        }
        
    }
}

struct SkinQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SkinQuizView(user: User())
    }
}
