//
//  SettingsViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var ProfilePictureImageURL: String
    @Published var forename: String
    @Published var surname: String
    
    @Published var showErrorMessage: Bool = false
    @Published var errorMessage: String?
    
    var coordinator: Coordinator?
    let authService: AuthenticationService = AuthenticationService()
    
    init(coordinator: Coordinator?) {
        self.coordinator = coordinator
        self.ProfilePictureImageURL = "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8"
        self.forename = "Lindsay"
        self.surname = "Lohan"
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
