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
        VStack(alignment: .leading) {
            Text(ingredient.name)
                .title()
                .padding(.bottom, 5)
            Text(ingredient.description)
        }
        .padding(20)
        .background(Color("White"))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 2, y: 2)
        .padding(.bottom, 10)
    }
}

struct IngredientCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCard(ingredient: ingredients[1])
    }
}
