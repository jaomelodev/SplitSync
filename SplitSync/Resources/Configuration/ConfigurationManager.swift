//
//  ConfigurationManager.swift
//  SplitSync
//
//  Created by João Melo on 07/09/24.
//
import Foundation

private enum BuildConfiguration {
    enum BuildConfigError: Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw BuildConfigError.missingKey
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw BuildConfigError.invalidValue
        }
    }
}

enum AppConfig {
    enum AppEnv {
        case dev, prod
    }

    static var appEnv: AppEnv {
        #if DEV
        return .dev
        #else
        return .prod
        #endif
    }

    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
