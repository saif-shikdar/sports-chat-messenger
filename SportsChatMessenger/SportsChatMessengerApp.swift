//
//  SportsChatMessengerApp.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import FirebaseCore
import SwiftData
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct SportsChatMessengerApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var coordinator = Coordinator()
    @StateObject var authService = AuthenticationService()

    var body: some Scene {
        WindowGroup {
            CoordinatorContentView()
                .environmentObject(authService)
                .environmentObject(coordinator)
        }
    }
}
