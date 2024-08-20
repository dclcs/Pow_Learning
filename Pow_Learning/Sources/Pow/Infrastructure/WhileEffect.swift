//
//  WhileEffect.swift
//  Pow_Learning
//
//  Created by daicanglan on 2024/8/20.
//

import SwiftUI

public extension View {
    
    @ViewBuilder
    func conditionEffect(_ effect: AnyConditionalEffect, condition: Bool) -> some View{
        switch effect.guts {
        case .continuous(let effect):
            modifier(ContinuousEffectModifier(effect: effect, isActive: condition))
        }
    }
}


public struct AnyConditionalEffect {
    internal enum Guts {
        case continuous(AnyContinuousEffect)
    }
    
    internal var guts: Guts

    private init(guts: Guts) {
        self.guts = guts
    }
    
    
    internal static func continuous(_ effect: AnyContinuousEffect) -> AnyConditionalEffect {
        AnyConditionalEffect(guts: .continuous(effect))
    }
    
}


private struct ContinuousEffectModifier: ViewModifier {

    var effect: AnyContinuousEffect

    var isActive: Bool

    @State
    private var changeCount: Int = 0

    @State
    private var startDate: Date = .distantPast

    func body(content: Content) -> some View {
        content
            .modifier(effect.viewModifier(isActive))
    }
}
