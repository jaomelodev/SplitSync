//
//  AppTexts.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import Foundation

enum TextKeys: String {
    case helloMessage
    case helloDescription
}

// swiftlint:disable line_length
let defaultTextsMap: [TextKeys: String] = [
    .helloMessage: "<font:fontStyle:titleLarge color:accentColor>Hello My Friend</font>",
    .helloDescription: "<font:fontStyle:body color:textBlack opacity:0.7>You're welcome to our app </font><font:fontStyle:linkSmall color:accentColor opacity:0.7 href:https://www.google.com/>Link</font>"
]
// swiftlint:enable line_length
