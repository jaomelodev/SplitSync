//
//  OnboardingViewInjector.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

class OnboardingViewInjector: Injector {
    typealias Controller = OnboardingController

    func registerDependencies() -> OnboardingController {
        let client = SplitSyncClientFirestore()

        let onboardingService = OnboardingService(client: client)

        let getOnboardingUseCase = GetOnboardingUseCaseImpl(getOnboardingService: onboardingService)

        return OnboardingController(
            getOnboardingUseCase: getOnboardingUseCase
        )
    }
}
