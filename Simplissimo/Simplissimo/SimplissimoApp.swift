//
//  SimplissimoApp.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import SwiftUI
import WrappingHStack

@main
struct SimplissimoApp: App {
    @State var carbonaraRecipe = RecipeData.carbonara
    
    var body: some Scene {
        WindowGroup {
            RecipeFullScreenView(recipe: $carbonaraRecipe)
        }
    }
}
