//
//  MockAuthenticationService.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 07/03/2025.
//

@testable import SportsChatMessenger
import Foundation

class MockAuthenticationService: AuthenticationService {
    var signInCallCount = 0
    var shouldFail = false

    override func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        signInCallCount += 1
        if shouldFail {
            completion(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"]))
        } else {
            completion(nil)
        }
    }
}
