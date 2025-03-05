//
//  LoginViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 04/03/2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showErrorMessage = false
    @Published var errorMessage: String?
    
    var coordinator: Coordinator?
    let authService: AuthenticationService = AuthenticationService()
    
    init(coordinator: Coordinator?) {
        self.coordinator = coordinator
    }
    
    func signIn() {
        if (self.email.isEmpty || self.password.isEmpty) {
            self.showErrorMessage = true
            self.errorMessage = "Fields cannot be empty"
        } else {
            authService.signIn(email: email, password: password) { error in
                if let e = error {
                    self.showErrorMessage = true
                    self.errorMessage = e.localizedDescription
                }
            }
        }
    }
}

extension LoginViewModel: LoginViewModelProtocol {
    func navigateBackToRoot() {
        coordinator?.clearNavigationStack()
    }
    
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator?.pushPage(page)
    }
}

