//
//  Injector.swift
//  SplitSync
//
//  Created by João Melo on 09/09/24.
//

protocol Injector {
    associatedtype Controller

    func registerDependencies() -> Controller
}
