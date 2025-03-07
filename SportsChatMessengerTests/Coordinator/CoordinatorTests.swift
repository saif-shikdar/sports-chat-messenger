//
//  CoordinatorTests.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 07/03/2025.
//

import XCTest
@testable import SportsChatMessenger

final class CoordinatorTests: XCTestCase {
    
    var coordinator: Coordinator!

    override func setUpWithError() throws {
        coordinator = Coordinator()
    }

    override func tearDownWithError() throws {
        coordinator = nil
    }

    // Test pushing a new page
    func testPushPage() {
        XCTAssertEqual(coordinator.navigationPath.count, 0)

        coordinator.pushPage(.signUp)
        XCTAssertEqual(coordinator.navigationPath.count, 1)
    }

    // Test pushing multiple pages
    func testPushMultiplePages() {
        coordinator.pushPage(.signUp)
        coordinator.pushPage(.profile)

        XCTAssertEqual(coordinator.navigationPath.count, 2)
    }

    // Test pushing the root clears the navigation stack
    func testPushRootPageClearsNavigationStack() {
        coordinator.pushPage(.signUp)
        coordinator.pushPage(.profile)
        XCTAssertEqual(coordinator.navigationPath.count, 2)

        coordinator.pushPage(.root) // This should reset the stack
        XCTAssertEqual(coordinator.navigationPath.count, 0)
    }

    // Test clearing the navigation stack
    func testClearNavigationStack() {
        coordinator.pushPage(.signUp)
        coordinator.pushPage(.profile)
        XCTAssertEqual(coordinator.navigationPath.count, 2)

        coordinator.clearNavigationStack()
        XCTAssertEqual(coordinator.navigationPath.count, 0)
    }
}
