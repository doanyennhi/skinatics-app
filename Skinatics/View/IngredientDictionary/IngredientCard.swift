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
                .padding(.bottom, 5)
                .font(Font.custom("Avenir", size: 24))
                .bold()
                .foregroundColor(Color("Dark Green"))
            Text(ingredient.description)
        }
        .padding(20)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 2, y: 2)
        .padding(.bottom, 10)
    }
}

struct IngredientCard_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCard(ingredient: ingredients[1])
    }
}
