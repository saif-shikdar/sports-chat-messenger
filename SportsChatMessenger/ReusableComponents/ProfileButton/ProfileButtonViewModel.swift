//
//  ProfileButtonViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 04/03/2025.
//

import Foundation

class ProfileButtonViewModel: ProfileButtonViewModelProtocol, ObservableObject {
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator.pushPage(page)
    }
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
