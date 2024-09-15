//
//  SplitSyncApp.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    return true
  }
}

@main
struct SplitSyncApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init() {
        #if !PREVIEW
        FirebaseApp.configure()
        #endif
    }

    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
    }
}
