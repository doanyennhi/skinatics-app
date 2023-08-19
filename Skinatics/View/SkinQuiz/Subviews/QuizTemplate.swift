//
//  QuizTemplate.swift
//  Skinatics
//
//  Created by Nhii on 19/8/2023.
//

import SwiftUI

struct QuizTemplate<Content: View>: View {
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var title: String
    var subheading: String
    @State var show: Bool = false
    var options: [String]
    @Binding var selected: Set<String>
    var screen: Content
    var btnText: String
    var selectionOptional: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: title)
                    .padding(.bottom, 5)
             
                Text(subheading)
                    .foregroundColor(Color("Secondary Green"))
                    .padding(.bottom, 20)
            
                    show ?
                        Text("Please select at least one item")
                            .foregroundColor(.red)
                            .padding(.top, 5)
                     : nil

                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: twoColumnGrid) {
                        ForEach(options, id: \.self) { item in
                            Checkbox(content: item, isSelected: selected.contains(item)) {
                                toggleItem(list: &selected, item: item)
                                print(selected)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                .verticalFadeOut()
                
                NavigationLink {
                    screen
                } label: {
                    Text(btnText)
                }
                .disabled(selectionOptional ? false : selected.isEmpty)
                .buttonStyle(PrimaryButtonStyle())
                .simultaneousGesture(
                    TapGesture().onEnded {
                        print(selected)
                        if !selectionOptional {
                            if selected.isEmpty {
                                show = true
                            } else {
                                show = false
                            }
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

//struct QuizTemplate_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizTemplate()
//    }
//}
