//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

// Third screen of quiz
struct SkinConditionView: View {
    @State var selected = Set<String>()
    @State var user: User
 
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: NewView(user: user), btnText: "Submit", selectionOptional: true, action: {user.skinConditions = selected})
    }
}

struct NewView: View {
    var user: User
    
    var body: some View {
        Text("Name: \(user.name)")
        Text("Email: \(user.email)")
        
        Text("Skin types")
        List([String](user.skinTypes), id: \.self) { item in
            Text(item)
        }
        
        Text("Skin issues")
        List([String](user.skinIssues), id: \.self) { item in
            Text(item)
        }
        
        Text("Skin conditions")
        List([String](user.skinConditions), id: \.self) { item in
            Text(item)
        }
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>(), user: User())
    }
}
