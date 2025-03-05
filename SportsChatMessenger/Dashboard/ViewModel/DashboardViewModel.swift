//
//  RootViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class DashboardViewModel: ObservableObject {
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator?) {
        self.coordinator = coordinator
    }
    
    func openProfile() -> Void {
        navigateToPage(.profile)
    }
}

extension DashboardViewModel: DashboardViewModelProtocol {
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator?.pushPage(page)
    }
}
