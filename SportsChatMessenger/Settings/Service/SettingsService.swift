//
//  SettingsService.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 10/03/2025.
//

import FirebaseCore
import FirebaseFirestore

class SettingsService {
    let db = Firestore.firestore()

    func getUserData(
        userID: String, completion: @escaping (Result<User?, Error>) -> Void
    ) async {
        db.collection("users").whereField("uid", isEqualTo: userID).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents, !documents.isEmpty else {
                completion(.failure(CustomError.noData))
                return
            }
            
            let users = documents.compactMap { (queryDocumentSnapshot) -> User? in
                return try? queryDocumentSnapshot.data(as: User.self)
            }
            
            completion(.success(users.first))
        }
    }
}
