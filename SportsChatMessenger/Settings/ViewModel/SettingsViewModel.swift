//
//  SettingsViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class SettingsViewModel: SettingsViewModelProtocol, ObservableObject {
    func navigateBackToRoot() {
        coordinator.clearNavigationStack()
    }
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator.pushPage(page)
    }
}
