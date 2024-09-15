//
//  OnboardingController.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import Foundation

class OnboardingController: AppController {
    let getOnboardingUseCase: GetOnboardingUseCase

    init(getOnboardingUseCase: GetOnboardingUseCase) {
        self.getOnboardingUseCase = getOnboardingUseCase
    }

    @Published private(set) var onboardingPages: [OnboardingPageEntity] = []
    @Published private(set) var currentIndex: Int = 0
    @Published private(set) var isLoading: Bool = true

    func getOnboarding() async -> Bool {
        DispatchQueue.main.async {
            self.isLoading = true
        }

        let response = await getOnboardingUseCase.execute(NoParams())

        switch response {
        case .success(let success):
            DispatchQueue.main.async {
                self.onboardingPages = success
                self.currentIndex = 0
                self.isLoading = false
            }
            return true
        case .failure:
            return false
        }
    }

    func gotToNextPage() {
        if currentIndex == onboardingPages.count - 1 {
            return
        }

        currentIndex += 1
    }

    func gotToLastPage() {
        currentIndex = onboardingPages.count - 1
    }

    func goToPreviousPage() {
        if currentIndex == 0 {
            return
        }

        currentIndex -= 1
    }
}
