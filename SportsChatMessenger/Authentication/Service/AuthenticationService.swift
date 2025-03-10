//
//  AuthenticationService.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 05/03/2025.
//

import FirebaseAuth

class AuthenticationService: ObservableObject {

    @Published var signedIn: Bool = false

    let auth = Auth.auth()
    let sessionStorage = SessionStorage()

    init() {
        _ = auth.addStateDidChangeListener { _, user in
            if user != nil {
                self.signedIn = true
            } else {
                self.signedIn = false
            }
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                completion(e)
            } else {
                self.sessionStorage.storeUserEmail(email: email)
                self.sessionStorage.storeUserID(userID: authResult?.user.uid ?? "")
                completion(nil)
            }
        }
    }

    func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try auth.signOut()
            completion(nil)
        } catch {
            print("Error signing out: \(error)")
            completion(error)
        }
    }
}
