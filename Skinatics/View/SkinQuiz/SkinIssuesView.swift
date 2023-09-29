//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

// skin issue options
var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging", "Dullness", "Fine lines", "Acne", "Acne scars", "Redness"]

// Second quiz, quiz on skin issues
struct SkinIssuesView: View {
    @EnvironmentObject private var authenticator: Authenticator
    @State var show = false
    @State var selected = Set<String>()
    
    // add selected options to user data
    var body: some View {
        QuizTemplate(title: "What do you need help with?", subheading: "Choose one or more skin concerns you want to treat", options: skinIssues, selected: $selected, screen: SkinConditionView(), btnText: "Next", selectionOptional: false, action: {authenticator.user.userMetadata["skinIssues"] = Array(selected)}, showUpdateError: .constant(false), errorMessage: .constant(""))
    }
}


struct SkinIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView(selected: Set<String>())
    }
}
