//
//  IngredientsView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct IngredientsView: View {
    @Binding var searchText: String
    
    var ingredients: [Ingredient] = [
        Ingredient(name: "Adenosine", description: ""),
        Ingredient(name: "Algae Extract", description: "")
    ]
    
    var searchResults: [Ingredient] {
            if searchText.isEmpty {
                return ingredients
            } else {
                return ingredients.filter { $0.name.contains(searchText) }
            }
        }
    
    var body: some View {
        List (searchResults) { ingredient in
                Text(ingredient.name)
            }
        .listRowBackground(Color("Floral White"))
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView(searchText: .constant(""))
    }
}
