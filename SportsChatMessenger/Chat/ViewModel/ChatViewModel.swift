//
//  ChatViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation

class ChatViewModel: ChatViewModelProtocol, ObservableObject {
    
    var coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func navigateBackToRoot() {
        coordinator.clearNavigationStack()
    }
    
    func navigateToPage(_ page: Coordinator.Page) {
        coordinator.pushPage(page)
    }
}
