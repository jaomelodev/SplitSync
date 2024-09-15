//
//  AppController.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import Foundation

class AppController: ObservableObject, Hashable {
    static func == (lhs: AppController, rhs: AppController) -> Bool {
        return lhs === rhs
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
