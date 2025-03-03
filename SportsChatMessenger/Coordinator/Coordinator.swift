//
//  Coordinator.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    // Manage the navigation stack here
    @Published var navigationPath = NavigationPath()
    
    func pushPage(_ page: Page) {
        
        if page == .root {
            // Home is the root, so we clear the path to navigation back
            navigationPath.removeLast(navigationPath.count)
        } else {
            navigationPath.append(page)
        }
    }
    
    func clearNavigationStack() {
        navigationPath.removeLast(navigationPath.count)
    }
    
    enum Page: Hashable {
        case root
    }
}

// ViewModel Protocols
protocol DashboardViewModelProtocol {
    func navigateToPage(_ page: Coordinator.Page)
}

protocol ChatViewModelProtocol {
    func navigateBackToRoot()
}

protocol SettingsViewModelProtocol {
    func navigateBackToRoot()
}
