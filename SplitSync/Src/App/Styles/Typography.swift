//
//  Typography.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import SwiftUI

extension Font {
    static let bodyMedium = Font.system(size: 16, weight: .medium, design: .default)
    static let bodyMediumBold = Font.system(size: 16, weight: .bold, design: .default)
    static let bodySmall = Font.system(size: 14, weight: .regular, design: .default)
    static let bodySmallBold = Font.system(size: 14, weight: .bold, design: .default)
    static let caption = Font.system(size: 12, weight: .medium, design: .default)
    static let captionBold = Font.system(size: 12, weight: .bold, design: .default)
    static let displayLarge = Font.system(size: 56, weight: .regular, design: .default)
    static let displayMedium = Font.system(size: 36, weight: .regular, design: .default)
    static let linkSemiBold = Font.system(size: 16, weight: .semibold, design: .default)
    static let link = Font.system(size: 16, weight: .regular, design: .default)
    static let linkSmall = Font.system(size: 14, weight: .semibold, design: .default)
    static let tag = Font.system(size: 13, weight: .regular, design: .default)
    static let tagSemiBold = Font.system(size: 13, weight: .semibold, design: .default)
    static let tagBold = Font.system(size: 13, weight: .bold, design: .default)
    static let titleLarge = Font.system(size: 32, weight: .medium, design: .default)
    static let titleLargeBold = Font.system(size: 32, weight: .bold, design: .default)
    static let titleMedium = Font.system(size: 24, weight: .semibold, design: .default)
    static let titleSmall = Font.system(size: 20, weight: .semibold, design: .default)

    // swiftlint:disable:next cyclomatic_complexity
    static func fromString(_ fontString: String) -> Font {
        switch fontString {
        case "bodyMedium":
            return .bodyMedium
        case "bodyMediumBold":
            return .bodyMediumBold
        case "bodySmall":
            return .bodySmall
        case "bodySmallBold":
            return .bodySmallBold
        case "caption":
            return .caption
        case "captionBold":
            return .captionBold
        case "displayLarge":
            return .displayLarge
        case "displayMedium":
            return .displayMedium
        case "linkSemiBold":
            return .linkSemiBold
        case "link":
            return .link
        case "linkSmall":
            return .linkSmall
        case "tag":
            return .tag
        case "tagSemiBold":
            return .tagSemiBold
        case "tagBold":
            return .tagBold
        case "titleLarge":
            return .titleLarge
        case "titleLargeBold":
            return .titleLargeBold
        case "titleMedium":
            return .titleMedium
        case "titleSmall":
            return .titleSmall
        default:
            return .bodyMedium
        }
    }
}
