//
//  CoordinatorView.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//
import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .splash(controller: SplashViewInjector().registerDependencies()))
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet: sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    coordinator.buildCover(cover: cover)
                }
        }
        .environmentObject(coordinator)
    }
}
