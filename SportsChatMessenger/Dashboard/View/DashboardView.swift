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
                    .font(DesignTokens.Typography.titleFont)
                    .foregroundStyle(DesignTokens.Colors.primary)
            }
            .safeAreaPadding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileButtonView(
                        imageURL: "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
                        buttonTapped: viewModel.openProfile)
                }
            }
            .background {
                Image(Images.backgroundImage)
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
