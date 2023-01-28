//
//  RecipeData.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import Foundation
import SwiftUI


struct RecipeData {
    var name: String
    var description: String = ""
    var image: Image
    var isFavourite = false
    var ingredients: [RecipeIngredient]
    var stages: [RecipeCookingStage]
    
    //MARK: -Temporary
    var expectedPreparationTimeInMinutes: Int = 30
    var totalTimeInMinutes: Int = 60
}

struct RecipeIngredient: Hashable, Identifiable {
    var text: String
    var color: Color
    var emoji: String = ""
    var quantity: String = ""
    
    let id: String = UUID().uuidString
}

struct RecipeStep: Hashable, Identifiable {
    var text: String
    var type: RecipeStepType = .mainText
    
    let id: String = UUID().uuidString
}

struct RecipeCookingStage: Hashable, Identifiable {
    var title: String
    var steps: [RecipeStep]
    
    let id: String = UUID().uuidString
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
        
        stages: [
            RecipeCookingStage(
                title: "Making egg and cheese mixture",
                steps: [
                    RecipeStep(text: "Separate egg yolks from egg whites."),
                    RecipeStep(text: "Grate parmesan cheese and mix well with egg yolks, until homogenous")
                ]),
            
            RecipeCookingStage(
                title: "Frying bacon and boiling pasta",
                steps: [
                    RecipeStep(text: "Cut bacon into small chunks, fry over low heat, so more fat renders."),
                    RecipeStep(text: "Cook pasta in salty water till al dente (usually 1 minute less then what the package says).")
                ]),
            
            RecipeCookingStage(
                title: "Final assembly",
                steps: [
                    RecipeStep(text: "Transfer pasta from the pot directly into pan with bacon, add a few table spoons of pasta water, then mix well."),
                    RecipeStep(text: "Add egg mixture into the pan, whisk constantly."),
                    RecipeStep(text: "If the egg mixture is too runny, use low heat, but don't stop whisking."),
                    RecipeStep(text: "Remember to kill the heat before the egg mixture is fully cooked, as residual heat from the pan will cook it more.")
                ])
            ])
            

    
    static let cinnamonRolls =
    RecipeData(
        name: "Cinnamon Rolls With Cream",
        description: "With cream and caramel topping",
        image: Image("Demo_Image_CinnamonRolls"),
        ingredients: [
            RecipeIngredient(text: "flour", color: .white),
            RecipeIngredient(text: "sugar", color: .blue.opacity(0.5)),
            RecipeIngredient(text: "salt", color: .orange.opacity(0.5)),
            RecipeIngredient(text: "milk", color: .green.opacity(0.5), emoji: "🥛"),
            RecipeIngredient(text: "butter", color: .orange.opacity(0.5), emoji: "🧈"),
            RecipeIngredient(text: "eggs", color: .green.opacity(0.5), emoji: "🥚"),
        ],
        
        stages: [
            RecipeCookingStage(title: "Dought", steps: [RecipeStep(text: "")]),
            RecipeCookingStage(title: "Cinnamon & sugar filling", steps: [RecipeStep(text: "")]),
            RecipeCookingStage(title: "Rolling & baking", steps: [RecipeStep(text: "")])
        ]
    )
}



extension RecipeIngredient {
    static let emptyIngredient = RecipeIngredient(text: "", color: .gray.opacity(0.2))
}

enum RecipeStepType {
    case mainText, suggestion
}


extension RecipeIngredient {
    enum quantityType: String {
        case grams
        case liters
        case milligrams
        case milliliters
        case tablespoons
        case teaspoons
    }
}
