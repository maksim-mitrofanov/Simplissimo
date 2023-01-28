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
    var body: some Scene {
        WindowGroup {
            HomeView()
                .preferredColorScheme(.light)
                .onAppear {
                    for familyName in UIFont.familyNames {
                        for font in UIFont.fontNames(forFamilyName: familyName) {
                            print("-- Family: \(familyName). Font: \(font)")
                        }
                    }
                }
        }
    }
}
