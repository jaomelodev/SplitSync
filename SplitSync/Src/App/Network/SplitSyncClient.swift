//
//  SplitSyncClient.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation

protocol SplitSyncClient {
    func getAll<T: Decodable>(from collection: FirestoreCollections) async -> Result<[T], Error>
    func getBy<T: Decodable>(id: String, from collection: FirestoreCollections) async -> Result<T, Error>
}
