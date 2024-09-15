//
//  GetOnboardingUseCaseMock.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation

class GetOnboardingUseCaseMock: GetOnboardingUseCase {
    let result: Result<[OnboardingPageEntity], GetOnboardingError>

    init(result: Result<[OnboardingPageEntity], GetOnboardingError>) {
        self.result = result
    }

    override func execute(_ params: NoParams) async -> Result<[OnboardingPageEntity], GetOnboardingError> {
        return result
    }
}
