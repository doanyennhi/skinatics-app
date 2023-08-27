//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

// skin condition options
var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

// Third quiz, quiz on skin conditions
struct SkinConditionView: View {
    @State var selected = Set<String>()
    @State var user: User
 
    // add selected options to user data
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: HomeView(user: user).navigationBarBackButtonHidden(), btnText: "Submit", selectionOptional: true, action: {user.skinConditions = selected})
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>(), user: User())
    }
}
