//
//  LoginViewModelTests.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 07/03/2025.
//

import XCTest
@testable import SportsChatMessenger

final class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var mockAuthService: MockAuthenticationService!
    var mockCoordinator: MockCoordinator!

    override func setUp() {
        super.setUp()
        mockAuthService = MockAuthenticationService()
        mockCoordinator = MockCoordinator()
        viewModel = LoginViewModel(coordinator: mockCoordinator, authService: mockAuthService)
    }

    override func tearDown() {
        viewModel = nil
        mockAuthService = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testSignInFailsWithEmptyFields() {
        viewModel.email = ""
        viewModel.password = ""
        
        viewModel.signIn()
        
        XCTAssertTrue(viewModel.showErrorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Fields cannot be empty")
    }

    func testSignInCallsAuthService() {
        viewModel.email = "test@example.com"
        viewModel.password = "password123"

        viewModel.signIn()

        XCTAssertEqual(mockAuthService.signInCallCount, 1)
    }

    func testSignInFailsWithErrorMessage() {
        viewModel.email = "invalid@example.com"
        viewModel.password = "wrongpassword"
        
        mockAuthService.shouldFail = true
        viewModel.signIn()
        
        XCTAssertTrue(viewModel.showErrorMessage)
        XCTAssertEqual(viewModel.errorMessage, "Invalid credentials")
    }

    func testNavigationToRoot() {
        viewModel.navigateBackToRoot()
        XCTAssertTrue(mockCoordinator.didClearNavigation)
    }

    func testNavigationToPage() {
        viewModel.navigateToPage(.profile)
        XCTAssertEqual(mockCoordinator.pushedPage, .profile)
    }
}
