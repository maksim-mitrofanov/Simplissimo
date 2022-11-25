//
//  IngredientsStack.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 16.11.2022.
//

import SwiftUI
import WrappingHStack

struct IngredientsStack: View {
    let ingredients: [RecipeIngredient]
    
    
    var body: some View {
        WrappingHStack(ingredients, id: \.self, spacing: .constant(12), lineSpacing: 10) { ingredient in
            SingleIngredientView(ingredient: ingredient, size: .compact)
        }
    }
}

struct IngredientsStack_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsStack(ingredients: RecipeData.carbonara.ingredients)
    }
}
