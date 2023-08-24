//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging", "Dullness", "Fine lines", "Acne", "Acne scars", "Redness"]

// Second screen of quiz
struct SkinIssuesView: View {
    @State var show = false
    @State var selected = Set<String>()
    @State var user: User
    
    var body: some View {
        QuizTemplate(title: "What do you need help with?", subheading: "Choose one or more skin concerns you want to treat", options: skinIssues, selected: $selected, screen: SkinConditionView(user: user), btnText: "Next", selectionOptional: false, action: {user.skinIssues = selected})
    }
}


struct SkinIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView(selected: Set<String>(), user: User())
    }
}
