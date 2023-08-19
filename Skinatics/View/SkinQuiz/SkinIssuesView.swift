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
    var selectedTypes: Set<String>
    var twoColumnGrid: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        QuizTemplate(title: "What do you need help with?", subheading: "Choose one or more skin concerns you want to treat", options: skinIssues, selected: $selected, screen: SkinConditionView(selectedTypes: selectedTypes, selectedIssues: selected), btnText: "Next", selectionOptional: false)
    
    }
}


//struct SkinIssuesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkinIssuesView()
//    }
//}
