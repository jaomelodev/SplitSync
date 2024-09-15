//
//  RCHelper.swift
//  SplitSync
//
//  Created by João Melo on 08/09/24.
//

import Firebase

final class RCHelper {
    private let remoteConfig = RemoteConfig.remoteConfig()

    private func activateDebugMode() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }

    private func fetchRemoteConfig() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            remoteConfig.fetch { _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }

    private func activateRemoteConfig() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            remoteConfig.activate { _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }

    func initRemoteConfig() async -> Bool {
        do {
            #if DEBUG
            activateDebugMode()
            #endif

            try await fetchRemoteConfig()
            try await activateRemoteConfig()

            return true
        } catch {
            return false
        }
    }

    func getConfig(forKey key: RemoteConfigKeys) -> [String: Any] {
        let configValue = remoteConfig[key.rawValue].jsonValue

        if let jsonDict = configValue as? [String: Any] {
            return jsonDict
        }

        fatalError("Config not found!, Make sure to call initRemoteConfig before this method")
    }
}
