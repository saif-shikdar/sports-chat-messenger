//
//  RootViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class DashboardViewModel: DashboardViewModelProtocol, ObservableObject {
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator.pushPage(page)
    }
}
