//
//  SessionStorage.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 10/03/2025.
//

import Foundation

enum SessionStorageError: Swift.Error {
    case notFound
    case other(Error)
}

protocol SessionStorageType {
    var userID: String? { get }
    
    var userEmail: String? { get }
    
    func storeUserID(userID: String)

    func storeUserEmail(email: String)
}

class SessionStorage: SessionStorageType {
    private enum Constants {
        static let emailKey = "email"
        static let userIDKey = "firebaseUserID"
    }

    private let defaults = UserDefaults.standard

    var userID: String? {
        return defaults.value(forKey: Constants.userIDKey) as? String
    }
    
    var userEmail: String? {
        return defaults.value(forKey: Constants.emailKey) as? String
    }

    func storeUserID(userID: String) {
        defaults.set(userID, forKey: Constants.userIDKey)
    }

    func storeUserEmail(email: String) {
        defaults.set(email, forKey: Constants.emailKey)
    }
}
