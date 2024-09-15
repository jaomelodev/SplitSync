//
//  Coordinator.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//

import SwiftUI

enum AppPages: Hashable {
    case splash(controller: SplashViewController)
    case onboarding(controller: OnboardingController)
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }

    case forgotPassword
}

enum FullScreenCover: String, Identifiable {
    var id: String {
        self.rawValue
    }

    case signup
}

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    func push(page: AppPages) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func presentFullScreenCover(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }

    func dismissSheet() {
        self.sheet = nil
    }

    func dismissCover() {
        self.fullScreenCover = nil
    }
}
