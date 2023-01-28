//
//  RecipeFullScreenView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import SwiftUI
import WrappingHStack


struct RecipeGeneralDataView: View {
    @Binding var recipe: RecipeData
    @State private var isEditSheetPresented: Bool = false
    
    //Navigation back
    @Environment(\.presentationMode) var currentPresentationMode: Binding<PresentationMode>
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            backgroundFillAndRecipeImage
            
            HStack {
                generalRecipeDataView
                Spacer()
            }
            .padding()
            
            VStack(alignment: .center) {
                Divider()
                HStack(spacing: 20) {
                    Text("2 SERVINGS")
                    Divider()
                    Text("60 MINUTES")
                    Divider()
                    Text("10 STEPS")
                }
                .font(.subheadline)
                .bold()
                Divider()

            }
            .padding()
            
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $isEditSheetPresented) {
            EditRecipeSheetView(recipe: $recipe)
        }
    }
    
    var backgroundFillAndRecipeImage: some View {
        VStack {
            Rectangle()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .background {
                    Color.orange
                }
            
            //Recipe image
                .overlay {
                    recipe.image
                        .resizable()
                        .aspectRatio(1/1, contentMode: .fill)
                        .scaledToFill()
                }
                .clipped()
            
            //Top Gradient
                .overlay {
                    VStack {
                        Rectangle()
                            .fill (
                                LinearGradient(colors: [.white.opacity(0.7), .white.opacity(0)], startPoint: .top, endPoint: .bottom)
                            )
                            .frame(height: UIScreen.main.bounds.height / 10)
                        
                        Spacer()
                    }
                }
            
            //Back Button
                .overlay {
                    VStack {
                        HStack {
                            navigateBackButton
                            
                            Spacer()
                            
                        }
                        .padding()
                        .padding(.vertical)
                        
                        Spacer()
                    }
                    .padding(.top)
                }
        }
    }
    
    var generalRecipeDataView: some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.custom("NotoSansKannada-Bold", size: 35))
//            Text(recipe.description)
//                .font(.custom("NotoSansKannada", size: 20))
//                .foregroundColor(.gray)
        }
    }
    
    var navigateBackButton: some View {
        Button {
            currentPresentationMode.wrappedValue.dismiss()
        } label: {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 40)
                Image(systemName: "chevron.left")
                    .foregroundColor(Color(uiColor: .label))
                    .font(.title3)
            }
            
        }
    }
    
    var makeRecipeFavouriteButton: some View {
        Button {
            withAnimation {
                recipe.isFavourite.toggle()
            }
            
        } label: {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 35)
                    .shadow(color: .gray.opacity(0.4), radius: 5)
                Image(systemName: recipe.isFavourite ? "heart.fill" : "heart")
                    .foregroundColor(recipe.isFavourite ? Color("LikeButtonColor") : .black)
                    .font(.title3)
            }
        }
        .buttonStyle(NoFeedbackButtonStyle())
    }
    
    var recipeNameAndDescription: some View {
        VStack(alignment: .center) {
            Text(recipe.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            
            Text(recipe.description)
                .font(.callout)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
    
    var recipeTimeToCook: some View {
        VStack {
            Text("Preparation: " + recipe.expectedPreparationTimeInMinutes.description + " min")
                .font(.callout)
                .foregroundColor(Color(uiColor: .secondaryLabel))
            
            Text("Total time: " + recipe.totalTimeInMinutes.description + " min.")
                .font(.callout)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
}

struct RecipeGeneralDataView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGeneralDataView(recipe: .constant(.cinnamonRolls))
            .previewDevice("iPhone 14 Pro")
        
    }
}
