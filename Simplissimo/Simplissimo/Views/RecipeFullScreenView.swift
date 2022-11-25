//
//  RecipeFullScreenView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import SwiftUI
import WrappingHStack


struct RecipeFullScreenView: View {
    @Binding var recipe: RecipeData
    @State private var isEditSheetPresented: Bool = false
    
    //Drawing Constants
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        ZStack {
            getBackgroundGradient()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                HStack {
                    Spacer()
                    recipeTitleView
                    Spacer()
                    editRecipeButton
                }
                
                RecipeCardView(recipe: recipe)
                
                recipeIngredientsListView
                
                recipeStepsView
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isEditSheetPresented) {
            EditRecipeSheetView(recipe: $recipe)
        }
    }
    
    var recipeIngredientsListView: some View {
        HStack {
            VStack(alignment: .leading) {
                makeSectionTitleFrom(text: "Ingredients")

                
                IngredientsStack(ingredients: recipe.ingredients)
            }
        }
        .padding()
        .background {
            Rectangle()
                .fill(.ultraThickMaterial)

                .cornerRadius(cornerRadius)
        }
    }
    
    var recipeStepsView: some View {
        HStack {
            VStack(alignment: .leading) {
                makeSectionTitleFrom(text: "Steps")
                    .padding(.bottom)
                
                ForEach(recipe.steps, id: \.self) { stepData in
                    if stepData.type == .mainText {
                        Text("- " + stepData.text)
                            .font(.body)
                            .foregroundColor(Color(uiColor: .label))
                    }
                    else {
                        Text(stepData.text)
                            .font(.callout)
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 10)
                    }
                }
            }
            
        }
        .padding()
        .background {
            Rectangle()
                .fill(.ultraThickMaterial)
                .cornerRadius(cornerRadius)
        }
    }
    
    var recipeTitleView: some View {
        Text(recipe.name)
            .font(.largeTitle)
            .bold()
            .fontDesign(.rounded)
            .foregroundColor(Color("UniversalTextColor"))
    }
    
    var editRecipeButton: some View {
        HStack {
            Spacer()
            
            Button {
                isEditSheetPresented = true
            } label: {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .foregroundColor(.accentColor)
            }
        }
    }
    
    func makeSectionTitleFrom(text: String) -> some View {
        Text(text)
            .font(.title2)
            .bold()
            .fontDesign(.rounded)
    }
    
    func getBackgroundGradient() -> LinearGradient {
        LinearGradient(colors: [Color("BackgroundLightColor").opacity(0.8), Color("BackgroundLightColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct RecipeFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFullScreenView(recipe: .constant(.carbonara))
    }
}
