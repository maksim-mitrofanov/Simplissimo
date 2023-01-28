//
//  SingleRecipePreviewTest_One.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 26.12.2022.
//

import SwiftUI

struct SingleRecipePreviewTest_One: View {
    @State private var currentRecipe: RecipeData = .cinnamonRolls
    
    var body: some View {
        ZStack {
            //Background Color
            Color(red: 254 / 255, green: 247 / 255, blue: 227 / 255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                navigationBar
                
                ScrollView {
                    VStack(spacing: 0) {
                        recipeImageWithScaling
                        recipeDataPreview
                    }
                }
            }
        }
    }
    
    var navigationBar: some View {
        Rectangle()
            .aspectRatio(6/1, contentMode: .fit)
            .foregroundColor(.clear)
            .overlay {
                HStack {
                    Image(systemName: "arrowshape.backward")
                        .font(.title2)
                    
                    Spacer()
                }
                .padding(.horizontal)
            } 
    }
    
    var recipeImageWithScaling: some View {
        Rectangle()
            .aspectRatio(1/1, contentMode: .fit)
            .overlay {
                currentRecipe.image
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
    }
    
    var recipeDataPreview: some View {
        Rectangle()
            .aspectRatio(1.5/1, contentMode: .fit)
    }
}

struct SingleRecipePreviewTest_One_Previews: PreviewProvider {
    static var previews: some View {
        SingleRecipePreviewTest_One()
    }
}
