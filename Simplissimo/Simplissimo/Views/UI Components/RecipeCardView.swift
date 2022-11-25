//
//  RecipeCardView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import SwiftUI

struct RecipeCardView: View {
    
    let recipe: RecipeData
    
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .aspectRatio(1.4/1, contentMode: .fit)
                .foregroundColor(.clear)
            
            //Recipe Image
                .overlay {
                    recipe.image
                        .resizable()
                        .scaledToFill()
                }
                .clipped()
                .cornerRadius(cornerRadius)
            
            
        }
    }
}
