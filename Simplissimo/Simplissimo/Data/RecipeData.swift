//
//  RecipeData.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import Foundation
import SwiftUI

struct RecipeIngredient: Hashable {
    var text: String
    var color: Color
    var emoji: String = ""
    var quantity: String = ""
}

extension RecipeIngredient {
    static let emptyIngredient = RecipeIngredient(text: "", color: .gray.opacity(0.2))
}

enum RecipeStepType {
    case mainText, suggestion
}

struct RecipeStep: Hashable {
    var text: String
    var type: RecipeStepType
}

struct RecipeData {
    var name: String
    var image: Image
    var isFavourite = false
    var ingredients: [RecipeIngredient]
    var steps: [RecipeStep]
}


extension RecipeData {
    static let carbonara = RecipeData(
        name: "Pasta Carbonara",
        image: Image("DemoImagePasta"),
        ingredients: [
            
            RecipeIngredient(
                text: "Eggs",
                color: .green.opacity(0.5),
                emoji: "🥚"
            ),
            
            RecipeIngredient(
                text: "Pasta",
                color: .yellow.opacity(0.5),
                emoji: "🍝"
            ),
            
            RecipeIngredient(
                text: "Bacon",
                color: .red.opacity(0.5),
                emoji: "🥓"
            ),
            
            RecipeIngredient(
                text: "Cheese",
                color: .yellow.opacity(0.5),
                emoji: "🧀"
            )
        ],
        
        steps: [
            RecipeStep(text: "Fry bacon over low heat", type: .mainText),
            RecipeStep(text: "Boil pasta in salty water till al dente", type: .mainText),
            RecipeStep(text: "(1 minute less then what the package says)", type: .suggestion),
            RecipeStep(text: "While pasta is cooking, grate parmesan cheese and mix it with one egg yolk", type: .mainText),
            RecipeStep(text: "you can use the egg white in another recipe", type: .suggestion),
            RecipeStep(text: "When pasta is ready, use tongs to transfer pasta directly into pan with bacon", type: .mainText),
            RecipeStep(text: "add some pasta water to the pan if necessary", type: .suggestion),
            RecipeStep(text: "Kill the heat and add your cheese mixture to the pan", type: .mainText),
            RecipeStep(text: "Stir the pasta, so the egg doesn't curdle", type: .suggestion),
            RecipeStep(text: "If the eggs are runny, turn on low heat for a few seconds, keep stirring", type: .mainText)
            ])
}
