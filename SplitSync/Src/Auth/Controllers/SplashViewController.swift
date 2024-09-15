//
//  SplashViewController.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

import Foundation

class SplashViewController: AppController {
    func loadRemoteConfig() async {
        let rCHelper = RCHelper()

        if !(await rCHelper.initRemoteConfig()) {
            // TODO: Show some error in splash screen or redirect to some error page
            return
        }

        AppTexts.mergeAppTexts(newTexts: rCHelper.getConfig(forKey: .appTexts))
    }
}
