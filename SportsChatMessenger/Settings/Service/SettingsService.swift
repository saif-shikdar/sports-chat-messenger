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

    func fetchUserData(
        userID: String, completion: @escaping (Result<User?, Error>) -> Void
    ) {
        let docRef = db.collection("users").document(userID)

        docRef.getDocument(as: User.self) { result in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(_):
                completion(.failure(CustomError.noData))
            }
        }
    }

    func fetchUserProfile(
        userID: String, completion: @escaping (Result<Profile?, Error>) -> Void
    ) {
        let docRef = db.collection("profiles").document(userID)
        
        docRef.getDocument(as: Profile.self) { result in
            switch result {
            case .success(let profile):
                completion(.success(profile))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(CustomError.noData))
            }
        }
    }
}
