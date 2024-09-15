//
//  SplitSyncClientFirestore.swift
//  SplitSync
//
//  Created by João Melo on 15/09/24.
//

import Foundation
import FirebaseFirestore

class SplitSyncClientFirestore: SplitSyncClient {
    let db = Firestore.firestore()

    func getAll<T: Decodable>(from collection: FirestoreCollections) async -> Result<[T], any Error> {
        do {
            let snap = try await db.collection(collection.rawValue).getDocuments()

            let result = snap.documents.compactMap { document in
                try? document.data(as: T.self)
            }

            return .success(result)
        } catch {
            return .failure(error)
        }
    }

    func getBy<T: Decodable>(id: String, from collection: FirestoreCollections) async -> Result<T, any Error> {
        do {
            let doc = try await db.document("\(collection.rawValue)/\(id)").getDocument(as: T.self)

            return .success(doc)
        } catch {
            return .failure(error)
        }
    }
}
