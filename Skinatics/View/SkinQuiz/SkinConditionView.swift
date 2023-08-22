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
    // user's selected options in previous screens
    var selectedTypes: Set<String>
    @State var selectedIssues: Set<String>
 
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: NewView(selectedTypes: selectedTypes, selectedIssues: selectedIssues, selectedConditions: selected), btnText: "Submit", selectionOptional: true)
    }
}

struct NewView: View {
    var selectedTypes: Set<String>
    var selectedIssues: Set<String>
    var selectedConditions: Set<String>
    
    var body: some View {
        Text("Skin types")
        List([String](selectedTypes), id: \.self) { item in
            Text(item)
        }
        
        Text("Skin issues")
        List([String](selectedIssues), id: \.self) { item in
            Text(item)
        }
        
        Text("Skin conditions")
        List([String](selectedConditions), id: \.self) { item in
            Text(item)
        }
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>(), selectedTypes: Set<String>(), selectedIssues: Set<String>())
    }
}
