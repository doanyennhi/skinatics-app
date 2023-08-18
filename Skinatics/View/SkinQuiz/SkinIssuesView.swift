//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging", "Dullness", "Fine lines", "Acne", "Acne scars", "Redness"]


struct SkinIssuesView: View {
    // define grid structure
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var selectedIssues = Set<String>()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "What do you need help with?")
                    .padding(.bottom, 5)
                
                Text("Choose at least one of the following")
                    .foregroundColor(Color("Secondary Green"))
                    .padding(.bottom, 20)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: twoColumnGrid) {
                        ForEach(skinIssues, id: \.self) { issue in
                            Checkbox(content: issue, isSelected: selectedIssues.contains(issue)) {
                                toggleItem(list: &selectedIssues, item: issue)
                                print(selectedIssues)
                            }
                        }
                    }
                    .padding(.vertical, 20)
                }
                .verticalFadeOut()
    
                NavigationLink(destination: SkinConditionView()) {
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


struct SkinIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView()
    }
}
