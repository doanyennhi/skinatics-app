//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging", "Dullness", "Fine lines", "Acne", "Acne scars", "Redness"]


struct SkinIssuesView: View {
    @State var show = false
    @State var selected = Set<String>()
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        QuizTemplate(options: skinIssues, selected: selected, screen: SkinConditionView(selectedIssues: selected))
    
//        NavigationStack {
//            VStack {
//                ScreenTitle(title: "What do you need help with?")
//                    .padding(.bottom, 5)
//
//                Text("Choose one or more skin concerns you want to treat")
//                    .foregroundColor(Color("Secondary Green"))
//                    .padding(.bottom, 20)
//
//                Text(show ? "Please select at least one item" : "")
//                    .foregroundColor(.red)
//                    .padding(.top, 5)
//
//                ScrollView(showsIndicators: false) {
//                    LazyVGrid(columns: twoColumnGrid) {
//                        ForEach(skinIssues, id: \.self) { item in
//                            Checkbox(content: item, isSelected: selected.contains(item)) {
//                                toggleItem(list: &selected, item: item)
//                                print(selected)
//                            }
//                        }
//                    }
//                    .padding(.vertical, 20)
//                }
//                .verticalFadeOut()
//
//                NavigationLink {
//                    screen
//                } label: {
//                    Text("Next")
//                }
//                .disabled(selected.isEmpty)
//                .buttonStyle(PrimaryButtonStyle())
//                .simultaneousGesture(TapGesture().onEnded {
//                    if selected.isEmpty {
//                        show = true
//                    } else {
//                        show = false
//                    }
//                })
//
////                NavigationLink(destination: SkinConditionView(selectedIssues: selected)) {
////                   Text("Next")
////                }
////                .buttonStyle(PrimaryButtonStyle())
////                .disabled(selected.isEmpty)
////                .simultaneousGesture(TapGesture().onEnded {
////                    if selected.isEmpty {
////                        show = true
////                    } else {
////                        show = false
////                    }
////                })
//            }
//
//            .padding(.horizontal, 30)
//            .font(Font.custom("Avenir", size: 18))
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color("Floral White"))
//        }
    }
}

//
//struct SkinIssuesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkinIssuesView()
//    }
//}
