//
//  IngredientsView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [Ingredient] = [
        Ingredient(name: "Adenosine", description: ""),
        Ingredient(name: "Algae Extract", description: "")
    ]
    
    var body: some View {
        List(ingredients) { ingredient in
            Text(ingredient.name)
                .listRowBackground(Color("Floral White"))
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
