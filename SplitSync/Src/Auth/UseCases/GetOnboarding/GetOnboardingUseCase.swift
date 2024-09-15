//
//  GetOnboardingUseCase.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation

class GetOnboardingUseCase: UseCase<NoParams, [OnboardingPageEntity], GetOnboardingError> {}

class GetOnboardingUseCaseImpl: GetOnboardingUseCase {
    let getOnboardingService: GetOnboardingService

    init(getOnboardingService: GetOnboardingService) {
        self.getOnboardingService = getOnboardingService
    }

    override func execute(_ params: NoParams) async -> Result<[OnboardingPageEntity], GetOnboardingError> {
        let response = await getOnboardingService.getOnboarding()

        if case .failure(let failure) = response {
            return .failure(failure)
        }

        guard let data = try? response.get() else {
            return .failure(.parseError)
        }

        return .success(data.map { $0.toEntity() })
    }
}
