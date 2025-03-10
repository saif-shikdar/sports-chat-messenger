//
//  SettingsViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var user: User?
    
    @Published var showErrorMessage: Bool = false
    @Published var errorMessage: String?
    
    var coordinator: Coordinator?
    let authService: AuthenticationService
    let settingsService: SettingsService
    let sessionStorage: SessionStorage
    
    init(coordinator: Coordinator?,
         sessionStorage: SessionStorage = SessionStorage(),
         authService: AuthenticationService = AuthenticationService(),
         settingsService: SettingsService = SettingsService()
    ) {
        self.coordinator = coordinator
        self.sessionStorage = sessionStorage
        self.authService = authService
        self.settingsService = settingsService
    }
    
    func fetchData() async {
        guard let userID = sessionStorage.userID else {
            self.errorMessage = "Unable to fetch user information. Please try again later."
            self.showErrorMessage = true;
            return
        }
        
        await settingsService.getUserData(userID: userID) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.showErrorMessage = true;
            }
        }
    }
    
    func onProfileTapped() {
        print("Profile Button Tapped!")
    }
    
    func onSecurityTapped() {
        print("Security Button Tapped!")
    }
    
    func onContactUsTapped() {
        print("Contact Us Button Tapped!")
    }
    
    func onLogoutTapped() {
        authService.signOut { error in
            if let e = error {
                self.showErrorMessage = true
                self.errorMessage = e.localizedDescription
            }
        }
    }
}

extension SettingsViewModel: SettingsViewModelProtocol {
    func navigateBackToRoot() {
        coordinator?.clearNavigationStack()
    }
    
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator?.pushPage(page)
    }
}
