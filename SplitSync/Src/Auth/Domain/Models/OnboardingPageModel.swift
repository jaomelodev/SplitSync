//
//  OnboardingPageModel.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation
import FirebaseFirestore

struct OnboardingPageModel: Codable {
    @DocumentID var id: String?
    let title: String
    let subTitle: String
    let icon: String
    let order: Int

    func toEntity() -> OnboardingPageEntity {
        OnboardingPageEntity(
            id: id ?? "",
            icon: icon,
            title: title,
            subTitle: subTitle,
            order: order
        )
    }
}
