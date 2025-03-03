//
//  CoordinatorContentView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftData
import SwiftUI

struct CoordinatorContentView: View {
    @StateObject var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            TabView {
                DashboardView(viewModel: DashboardViewModel(coordinator: coordinator))
                    .tabItem {
                        Label("Dashboard", systemImage: "house.fill")
                    }
                ChatView(viewModel: ChatViewModel(coordinator: coordinator))
                    .tabItem {
                        Label("Chat", systemImage: "person.2.fill")
                    }
            }
            
        }
    }
}

#Preview {
    CoordinatorContentView()
}
