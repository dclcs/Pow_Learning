//
//  ContentView.swift
//  Pow_Learning
//
//  Created by daicanglan on 2024/8/20.
//

import SwiftUI

struct ContentView: View {
    
    @State
    var isPressed: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            
            Text("Push me")
                .font(.system(.title, design: .rounded, weight: .semibold))
                .blendMode(.destinationOut)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentColor.gradient, in: Capsule(style: .continuous))
                ._onButtonGesture {
                    isPressed = $0
                } perform: {

                }
                .compositingGroup()
                .padding()
                .conditionEffect(.pushDown, condition: isPressed)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
