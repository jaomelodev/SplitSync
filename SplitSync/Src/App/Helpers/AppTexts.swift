//
//  AppTexts.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import Foundation

class AppTexts {
    private static var textsMap: [TextKeys: String] = defaultTextsMap

    static func mergeAppTexts(newTexts: [String: Any]) {
        for (key, value) in newTexts {
            guard let textKey = TextKeys(rawValue: key) else {
                continue
            }

            AppTexts.textsMap[textKey] = "\(value)"
        }
    }

    static func getText(forKey key: TextKeys) -> String {
        guard let value = AppTexts.textsMap[key] else {
            return ""
        }

        return value
    }
}
