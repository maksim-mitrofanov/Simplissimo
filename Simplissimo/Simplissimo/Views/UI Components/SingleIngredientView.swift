//
//  SingleIngredientView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 16.11.2022.
//

import SwiftUI

enum IngredientViewSize {
    case compact, expanded
}


struct SingleIngredientView: View {
    let ingredient: RecipeIngredient
    var size: IngredientViewSize = .compact
    
    var body: some View {
        VStack {
            if ingredient.text.isEmpty {
                Text("Empty")
            }
            else {
                Text(ingredient.text + " " + ingredient.emoji)
            }
            
            if size == .expanded && !ingredient.quantity.isEmpty {
                Text("(\(ingredient.quantity))")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(ingredient.color)
        )
    }
}

struct SingleIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SingleIngredientView(
                ingredient:
                    RecipeIngredient(text: "00 Flour", color: .yellow, emoji: "💰", quantity: "400 gramms"), size: .expanded)
            
            SingleIngredientView(
                ingredient:
                    RecipeIngredient(text: "00 Flour", color: .yellow, emoji: "💰", quantity: "400 gramms"), size: .compact)
        }
       
    }
}
