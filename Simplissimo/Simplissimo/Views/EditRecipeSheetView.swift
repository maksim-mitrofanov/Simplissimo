//
//  EditRecipeSheetView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 16.11.2022.
//

import SwiftUI
import PhotosUI
import WrappingHStack

struct EditRecipeSheetView: View {
    @Binding var recipe: RecipeData
    
    //Adding or Editing Ingredient Sheet
    @State private var isIngredientSheetPresented: Bool = false
    @State private var selectedIngredientIndex: Int = 0
    @State private var isEditingIngredients: Bool = false
    
    //Selecting Image
    @State private var selectedItem: PhotosPickerItem? = nil
    
    //Drawing Constants
    private let cornerRadius: CGFloat = 20
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            editRecipeImageView
            editRecipeNameView
            editIngredientsListView
//            editRecipeStepsView
        }
        .padding()
        .onChange(of: selectedItem, perform: updateRecipeImage(newItem:))
        .sheet(isPresented: $isIngredientSheetPresented) {
            EditSingleIngredientView(currentIngredient: $recipe.ingredients[selectedIngredientIndex])
        }
    }
    
    var editRecipeNameView: some View {
        VStack(alignment: .leading) {
            Text("Recipe Name: ").font(.title2).bold()
            TextField("Enter recipe name here", text: $recipe.name)
                .padding()
                .background {
                    Color(UIColor.systemBackground)
                }
                .cornerRadius(cornerRadius - 5)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThickMaterial)
        }
    }
    
    var editRecipeImageView: some View {
        VStack(alignment: .leading) {
            Text("Recipe Image: ").font(.title2).bold()
//            RecipeCardView(recipe: recipe)
            PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                RoundedRectangle(cornerRadius: cornerRadius - 5)
                    .aspectRatio(7/1, contentMode: .fit)
                    .overlay {
                        Text("Select Image")
                            .foregroundColor(.white)
                    }
            }
            
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThickMaterial)
        }
    }
    
    var editIngredientsListView: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Ingredients List: ").font(.title2).bold()
                Spacer()
                
                addRecipeIngredientButton
                editIngredientsButton
            }
            
            WrappingHStack(recipe.ingredients, id: \.self, spacing: .constant(12), lineSpacing: 10) { ingredient in
                SingleIngredientView(ingredient: ingredient, size: .compact)
                    .transition(.scale)
                
                    .onTapGesture {
                        selectedIngredientIndex = recipe.ingredients.firstIndex(of: ingredient) ?? 0
                        isIngredientSheetPresented = true
                    }
                
                    .overlay {
                        deleteRecipeOverlay
                            .disabled(isEditingIngredients ? false : true)
                        
                            .onTapGesture {
                                withAnimation {
                                    deleteTappedIngredient(ingredient: ingredient)
                                }
                            }
                    }
                    .transition(.opacity)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThickMaterial)
        }
    }
    
    var editIngredientsButton: some View {
        Button {
            withAnimation {
                isEditingIngredients.toggle()
            }
        } label: {
            Image(systemName: "square.and.pencil")
                .font(.title2)
        }
        .offset(x: 5, y: -5)
    }
    
    var addRecipeIngredientButton: some View {
        Button {
            recipe.ingredients.append(.emptyIngredient)
            selectedIngredientIndex = recipe.ingredients.endIndex - 1
            isIngredientSheetPresented = true
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
        }
        .offset(x: 5, y: -5)
    }
    
    var deleteRecipeOverlay: some View {
        VStack {
            HStack {
                Spacer()
                Circle().foregroundColor(.red)
                    .frame(width: 20)
                    .overlay {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .bold()
                            .font(.subheadline)
                    }
                    .opacity(isEditingIngredients ? 1 : 0)
            }
            Spacer()
            
        }
        .offset(x: 8, y: -8)
    }
    
//    var editRecipeStepsView: some View {
//        HStack(alignment: .top) {
//            VStack(alignment: .leading) {
//                Text("Steps: ")
//                    .font(.title2).bold()
//                    .fontDesign(.rounded)
//                    .padding(.bottom)
//
//                ForEach(recipe.steps, id: \.self) { stepData in
//                    if stepData.type == .mainText {
//                        Text("- " + stepData.text)
//                            .font(.body)
//                            .foregroundColor(Color(uiColor: .label))
//                    }
//                    else {
//                        Text(stepData.text)
//                            .font(.callout)
//                            .foregroundColor(Color(uiColor: .secondaryLabel))
//                            .padding(.bottom, 10)
//                            .padding(.horizontal, 10)
//                    }
//                }
//            }
//           Spacer()
//        }
//        .padding()
//        .background {
//            RoundedRectangle(cornerRadius: 20)
//                .fill(.ultraThickMaterial)
//        }
//    }
    
    var addCookingStepButton: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.title2)
        }
        .offset(x: 5, y: -5)
    }
        
    func updateRecipeImage(newItem: PhotosPickerItem?) {
        Task {
            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    recipe.image = Image(uiImage: uiImage)
                }
            }
        }
    }
    
    func deleteTappedIngredient(ingredient: RecipeIngredient) {
        withAnimation {
            if let index = recipe.ingredients.firstIndex(of: ingredient) {
                recipe.ingredients.remove(at: index)
            }
        }
    }
}

struct EditRecipeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeSheetView(recipe: .constant(.carbonara))
    }
}
