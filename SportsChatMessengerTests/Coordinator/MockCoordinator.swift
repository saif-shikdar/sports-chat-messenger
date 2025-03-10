//
//  MockCoordinator.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 07/03/2025.
//

@testable import SportsChatMessenger

class MockCoordinator: Coordinator {
    var didClearNavigation = false
    var pushedPage: Coordinator.Page?

    override func clearNavigationStack() {
        didClearNavigation = true
    }

    override func pushPage(_ page: Coordinator.Page) {
        pushedPage = page
    }
}
