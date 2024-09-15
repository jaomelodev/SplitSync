//
//  SplashScreenInjector.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

class SplashViewInjector: Injector {
    typealias Controller = SplashViewController

    func registerDependencies() -> SplashViewController {
        SplashViewController()
    }
}
