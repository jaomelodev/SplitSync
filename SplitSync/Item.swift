//
//  Item.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
