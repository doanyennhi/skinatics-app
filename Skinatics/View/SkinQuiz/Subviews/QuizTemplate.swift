//
//  QuizTemplate.swift
//  Skinatics
//
//  Created by Nhii on 19/8/2023.
//

import SwiftUI

/// Define a general template/ structure for some skin quiz views to follow
struct QuizTemplate<Content: View>: View {
    // define grid's column structure
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    // Info needed for each screen
    var title: String
    var subheading: String
    @State var show: Bool = false    //  track if error text should be displayed
    var options: [String]            // quiz options
    @Binding var selected: Set<String>     // user's selection in quiz
    var screen: Content              // screen to navigate to
    var btnText: String
    var selectionOptional: Bool     // state if this quiz section is optional
    var action: () -> Void          // action when button is tapped
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: title)
                Subheading(subheading: subheading)
                
                ErrorText(show: $show, text: "Please select at least one item")

                // options displayed as checkboxes in 2 columns
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: twoColumnGrid) {
                        ForEach(options, id: \.self) { item in
                            Checkbox(content: item, isSelected: selected.contains(item)) {
                                toggleItem(set: &selected, item: item)
                                print(selected)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                .verticalFadeOut(fadeHeight: 50)
                
                NavigationLink {
                    screen
                } label: {
                    Text(btnText)
                }
                // if quiz is required, disable navigation if no options selected
                .disabled(selectionOptional ? false : selected.isEmpty)
                .buttonStyle(PrimaryButtonStyle())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        print(selected)
                        // show error message if quiz is required & no options selected
                        if !selectionOptional {
                            if selected.isEmpty {
                                show = true
                            } else {
                                show = false
                            }
                        }
                        action()
                })
            }
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
}
