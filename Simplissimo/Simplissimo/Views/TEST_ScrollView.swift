//
//  TEST_ScrollView.swift
//  Simplissimo
//
//  Created by Максим Митрофанов on 24.12.2022.
//

import SwiftUI

struct TEST_ScrollView: View {
    @State var scrolledDistance: CGFloat = .zero
    
    var body: some View {
        VStack {
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scrollSpace")).origin.y)
                }
            }
            .onPreferenceChange(ScrollPreferenceKey.self) { value in
                scrolledDistance = value
            }
            .background {
                Color.gray.opacity(0.1)
            }
            .coordinateSpace(name: "scrollSpace")
            .overlay {
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: 250 + scrolledDistance)
                        .foregroundColor(.green.opacity(0.4))
                    
                    Spacer()
                }
            }
            
            
            Text("\(Int(scrolledDistance))")
        }
    }
}

struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TEST_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TEST_ScrollView()
    }
}
