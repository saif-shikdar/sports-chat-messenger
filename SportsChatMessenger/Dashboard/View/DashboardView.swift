//
//  RootView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftUI
import SwiftUICore

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Hello Dashboard!")
            }
            .safeAreaPadding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dashboard")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileButtonView(
                        viewModel: ProfileButtonViewModel(
                            coordinator: viewModel.coordinator))
                }
            }
        }

    }
}
