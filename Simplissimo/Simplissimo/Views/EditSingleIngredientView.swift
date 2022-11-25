//
//  EditSingleIngredientView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 22.11.2022.
//

import SwiftUI

struct EditSingleIngredientView: View {
    @Binding var currentIngredient: RecipeIngredient
    
    private let cornerRadius: CGFloat = 14
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                viewHeader
                currentIngredientPreview
                    .padding(.bottom)
                editRecipeDataFields
            }
            .padding()
        }
    }
    
    var currentIngredientPreview: some View {
        HStack {
            Text(currentIngredient.text.isEmpty ? "Empty" : currentIngredient.text)
            Text(currentIngredient.emoji)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
        .frame(minHeight: UIScreen.main.bounds.width * 0.12)
        
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(currentIngredient.color)
        }
    }
    
    var editRecipeDataFields: some View {
        VStack(alignment: .leading) {
            Text("Ingredient Data").font(.title2).bold().fontDesign(.rounded)
            ingredientText
                .padding(.trailing)
            ingredientEmoji
            ingredientQuantity
            ingredientColorPicker
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.ultraThickMaterial)
        }
    }
    
    var viewHeader: some View {
        VStack(alignment: .leading) {
            Text("Ingredient")
                .font(.largeTitle)
                .bold()
                .fontDesign(.rounded)
        }
    }
    
    var ingredientText: some View {
        TextField("Ingredient Name", text: $currentIngredient.text)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
    
    var ingredientColorPicker: some View {
        ColorPicker("Ingredient Color", selection: $currentIngredient.color)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
    
    var ingredientEmoji: some View {
        TextField("Ingredient Emoji", text: $currentIngredient.emoji)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
    
    var ingredientQuantity: some View {
        TextField("Ingredient Quantity", text: $currentIngredient.quantity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
    }
}

struct EditSingleIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        EditSingleIngredientView(currentIngredient: .constant(.emptyIngredient))
    }
}
