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
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileButtonView(
                        imageURL: "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
                        buttonTapped: viewModel.openProfile)
                }
            }
            .background {
                Image("light-background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
            }
        }

    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel(coordinator: nil))
}
