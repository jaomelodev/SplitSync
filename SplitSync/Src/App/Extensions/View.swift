//
//  View.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import SwiftUI

struct OnceViewModifier: ViewModifier {
    @State private var hasAppeared = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                if !hasAppeared {
                    hasAppeared = true
                    action()
                }
            }
    }
}

extension View {
    func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        self.modifier(OnceViewModifier(action: action))
    }
}
