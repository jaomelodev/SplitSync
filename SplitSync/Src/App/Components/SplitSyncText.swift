//
//  AppText.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import SwiftUI

struct SplitSyncText: View {
    // swiftlint:disable:next force_try
    private static let regExp = try! NSRegularExpression(pattern: "<(font):([^>]*)>(.*?)<\\/\\1>")

    let text: String

    var body: some View {
        parseString(text: text)
    }

    private func parseString(text: String) -> Text {
        let nsString = text as NSString
        let matches = SplitSyncText.regExp.matches(in: text, range: NSRange(location: 0, length: text.count))

        if matches.isEmpty {
            return Text(text).font(.body)
        }

        var attributedString = AttributedString()

        for match in matches {
            let fontAttributesRange = match.range(at: 2)
            let innerTextRange = match.range(at: 3)

            let attributesString = nsString.substring(with: fontAttributesRange)
            let innerText = nsString.substring(with: innerTextRange)

            let styledText = parseAttributes(text: innerText, attributesString: attributesString)

            attributedString.append(styledText)
        }

        return Text(attributedString)
    }

    private func parseAttributes(text: String, attributesString: String) -> AttributedString {
        var attributedString = AttributedString(text)

        let attributes = attributesString.split(separator: " ")

        for attribute in attributes {
            let keyValue = attribute.split(separator: ":")

            if keyValue.count == 2 {
                let key = keyValue[0]
                let value = keyValue[1]

                switch key {
                case "fontStyle":
                    attributedString.font = .fromString(String(value))
                case "color":
                    attributedString.foregroundColor = .fromString(String(value))
                case "opacity":
                    if let opacityValue = Double(value) {
                        if var color = attributedString.foregroundColor {
                            color = color.opacity(opacityValue)
                            attributedString.foregroundColor = color
                        } else {
                            attributedString.foregroundColor = Color.black.opacity(opacityValue)
                        }
                    }
                default:
                    break
                }
            } else if keyValue.count == 3 && keyValue[0] == "href" {
                attributedString.link = .init(string: "\(keyValue[1]):\(keyValue[2])")
                attributedString.underlineStyle = .single
            }
        }

        return attributedString
    }
}

#Preview {
    SplitSyncText(
        text: "<font:fontStyle:bodySmall color:textBlack opacity:0.7>Test</font><font:fontStyle:linkSmall color:accentColor opacity:0.7 href:https://www.google.com/>Link</font>"
    )
}
