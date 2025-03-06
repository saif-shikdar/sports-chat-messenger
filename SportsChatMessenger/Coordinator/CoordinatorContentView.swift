//
//  CoordinatorContentView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftData
import SwiftUI

struct NavigationViewFactory: Equatable { // PreferenceKey's onChange value must be equatable so we conform to Equatable protocol
    let id: String
    let factory: (Any) -> AnyView

    init<D,C>(_ type: D.Type, @ViewBuilder _ factory: @escaping (D) -> C) where D: Identifiable, C: View {
        self.id = String(describing: type) // We save a string representation of the type as the identifier of the factory.
        self.factory = { value in
            // This scope is the only scope with information on both the data.Type and the view.Type.
            // So to ensure the data.Type is valid we cast the data from Any and call our closure with the data in it.
            if let value = value as? D {
                AnyView(factory(value))
            } else {
                // If we fail the casting we provide the same warning icon that navigationDestination does
                AnyView(Image(systemName: "exclamationmark.triangle").foregroundColor(.red))
            }
        }
    }

    static func == (lhs: NavigationViewFactory, rhs: NavigationViewFactory) -> Bool { lhs.id == rhs.id }
}

struct SheetFactoryKey: PreferenceKey {
    static var defaultValue: [String: NavigationViewFactory] = [:]
    static func reduce(value: inout [String: NavigationViewFactory], nextValue: () -> [String: NavigationViewFactory]) { value.merge(nextValue()) { $1 } } // reduce all into one value (dictionary)
}

struct CoverFactoryKey: PreferenceKey {
    static var defaultValue: [String: NavigationViewFactory] = [:]
    static func reduce(value: inout [String: NavigationViewFactory], nextValue: () -> [String: NavigationViewFactory]) { value.merge(nextValue()) { $1 } }
}

extension View {
    public func sheetDestination<D,C>(for data: D.Type, @ViewBuilder sheet: @escaping (D) -> C) -> some View where D: Identifiable & Hashable, C : View  {
        preference(key: SheetFactoryKey.self, value: [String(describing: data): NavigationViewFactory(data, sheet)]) // <- Here we set the key to the data type's description! and pass our view factory
    }

    public func coverDestination<D,C>(for data: D.Type, @ViewBuilder cover: @escaping (D) -> C) -> some View where D: Identifiable & Hashable, C : View  {
        preference(key: CoverFactoryKey.self, value: [String(describing: data): NavigationViewFactory(data, cover)])
    }
}

struct CoordinatorContentView: View {
    @StateObject var coordinator = Coordinator()
    @EnvironmentObject var authService: AuthenticationService

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            if authService.signedIn {
                createTabView()
                .navigationDestination(for: Coordinator.Page.self) { page in
                    switch page {
                    case .root:
                        createTabView()
                    case .profile:
                        ProfileView()
                    case .signUp:
                        LoginView(viewModel: LoginViewModel(coordinator: coordinator))
                    }
                }
            } else {
                LoginView(viewModel: LoginViewModel(coordinator: coordinator))
            }
        }
    }
    
    @ViewBuilder
    func createTabView() -> some View {
        TabView {
            DashboardView(
                viewModel: DashboardViewModel(
                    coordinator: coordinator)
            )
            .tabItem {
                Label("Dashboard", systemImage: "house.fill")
            }
            ChatView(
                viewModel: ChatViewModel(
                    coordinator: coordinator)
            )
            .tabItem {
                Label("Chat", systemImage: "person.2.fill")
            }
            SettingsView(
                viewModel: SettingsViewModel(
                    coordinator: coordinator)
            )
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
    }
}
