//
//  IngredientCard.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI

struct IngredientCard: View {
    private var ingredient: Ingredient
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
    }
    
    var body: some View {
        VStack {
            Text(ingredient.name).font(.headline)
            Text(ingredient.description)
        }
    }
}

struct IngredientCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCard(ingredient: ingredients[0])
    }
}
