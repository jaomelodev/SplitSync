//
//  Colors.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import SwiftUI

extension Color {
    static func fromString(_ colorString: String) -> Color {
        switch colorString {
        case "accentColor":
            return .accentColor
        case "accentColorDev":
            return .accentColorDev
        case "accentColorProd":
            return .accentColorProd
        case "backgroundBlack":
            return .backgroundBlack
        case "backgroundGray":
            return .backgroundGray
        case "backgroundWhite":
            return .backgroundWhite
        case "textBlack":
            return .textBlack
        case "textGray":
            return .textGray
        case "textWhite":
            return .textWhite
        default:
            return .textBlack
        }
    }
}
