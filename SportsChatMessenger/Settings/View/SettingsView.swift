//
//  SettingsView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftUI
import SwiftUICore

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ProfilePictureView(
                    imageURL: viewModel.user?.profilePictureURL ?? "",
                    forename: viewModel.user?.forename ?? "",
                    surname: viewModel.user?.surname ?? ""
                )
                .padding(.bottom, 64)
                Spacer()
                SettingsButtonView(iconName: "person.fill",
                                   text: "Profile",
                                   onButtonTap: viewModel.onProfileTapped)
                SettingsButtonView(iconName: "lock.shield.fill",
                                   text: "Security",
                                   onButtonTap: viewModel.onSecurityTapped)
                SettingsButtonView(iconName: "message.fill",
                                   text: "Contact Us",
                                   onButtonTap: viewModel.onContactUsTapped)
                SettingsButtonView(iconName: "lock.fill",
                                   text: "Sign Out",
                                   onButtonTap: viewModel.onLogoutTapped)
                .alert("Error", isPresented: $viewModel.showErrorMessage) {

                } message: {
                    Text(viewModel.errorMessage ?? "Unknown Error")
                }
            }
            .task {
                await viewModel.fetchData()
            }
            .safeAreaPadding()
            .background {
                Image(Images.lightBackground)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height
                    )
            }
        }
    }
}

#Preview {
    SettingsView(
        viewModel: SettingsViewModel(coordinator: nil)
    )
}
