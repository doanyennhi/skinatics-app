//
//  IngredientDictView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI

let ingredients = [Ingredient(name: "AHA", description: "AHA, also known as alpha hydroxy acid, exfoliates skin and improves signs of aging, dry skin and an uneven skin tone."), Ingredient(name: "Niacinamide", description: "Helps visibly minimize pore size, improve dull/uneven tone, and reduce wrinkle depth. Also known to fortify skin's barrier strength and boost hydration."), Ingredient(name: "Benzoyl Peroxide", description: "This over-the-counter topical antibacterial acne treatment is widely considered the most effective because of its ability to penetrate hair follicles and kill acne-causing bacteria with low sensitivity."), Ingredient(name: "Glycerin", description: "A naturally occurring substance in skin that helps retain moisture. It is used in skin care products to help defend against dryness.")]

struct IngredientDictView: View {
    private var ingredients: [Ingredient]
    
    init(ingredients: [Ingredient]) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        VStack {
            ScreenTitle(title: "Ingredient Dictionary")
            ScrollView {
                ForEach(ingredients) { ingredient in
                    IngredientCard(ingredient: ingredient)
                }
            }
            .padding(.vertical, 20)
            .verticalFadeOut(fadeHeight: 50)
        }
        .modifier(ScreenModifier())
    }
}

struct IngredientDictView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientDictView(ingredients: ingredients)
    }
}
