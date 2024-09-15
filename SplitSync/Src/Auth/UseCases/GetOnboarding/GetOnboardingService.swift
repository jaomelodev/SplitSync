//
//  GetOnboardingService.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation

protocol GetOnboardingService {
    func getOnboarding() async -> Result<[OnboardingPageModel], GetOnboardingError>
}
