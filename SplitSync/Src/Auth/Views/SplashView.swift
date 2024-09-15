//
//  SplashView.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var controller: SplashViewController

    var body: some View {
        Image(.logoProd)
            .resizable()
            .frame(width: 216, height: 216)
            .onAppear {
                Task {
                    await controller.loadRemoteConfig()

                    coordinator.push(
                        page: .onboarding(
                            controller: OnboardingViewInjector().registerDependencies()
                        )
                    )
                }
            }
    }
}

#Preview {
    SplashView(
        controller: SplashViewController()
    )
}
