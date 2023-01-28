//
//  HomeView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 15.11.2022.
//

import SwiftUI

struct HomeView: View {
    @State private var cinnamons = RecipeData.cinnamonRolls
    @State private var carbonara = RecipeData.carbonara
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    RecipeGeneralDataView(recipe: $cinnamons)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Cinnamon Rolls")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .background {
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [Color.orange.opacity(0.6), Color.red.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                        }
                        .cornerRadius(20)
                }
                .padding(.vertical)
                
                NavigationLink {
                    RecipeGeneralDataView(recipe: $carbonara)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Carbonara")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                        .background {
                            Rectangle()
                            .fill(
                                LinearGradient(colors: [Color.orange.opacity(0.6), Color.red.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                        }
                        .cornerRadius(20)

                }
                
                NavigationLink {
                    TEST_ScrollView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("ScrollViewTest")
                        .padding()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension Font {
    public static func system(
        size: CGFloat,
        weight: UIFont.Weight,
        width: UIFont.Width) -> Font
    {
        // 1
        return Font(
            UIFont.systemFont(
                ofSize: size,
                weight: weight,
                width: width)
        )
    }
}
