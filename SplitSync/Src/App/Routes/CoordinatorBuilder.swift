//
//  CoordinatorBuilder.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//

import SwiftUI

extension Coordinator {
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .splash(let controller):
            SplashView(controller: controller)
        case .onboarding(let controller):
            OnboardingView(controller: controller)
        }
    }

    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case .forgotPassword:
            Text("ForgotPassword")
        }
    }

    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .signup:
            Text("Signup")
        }
    }
}
