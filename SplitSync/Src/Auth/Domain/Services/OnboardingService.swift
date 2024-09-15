//
//  OnboardingService.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation
import FirebaseFirestore

class OnboardingService: GetOnboardingService {
    let client: SplitSyncClient

    init(client: SplitSyncClient) {
        self.client = client
    }

    func getOnboarding() async -> Result<[OnboardingPageModel], GetOnboardingError> {
        let response: Result<[OnboardingPageModel], Error> = await client.getAll(from: .onboardings)

        switch response {
        case .success(let success):
            return .success(success)
        case .failure:
            return .failure(.onboardingNotFound)
        }
    }
}
