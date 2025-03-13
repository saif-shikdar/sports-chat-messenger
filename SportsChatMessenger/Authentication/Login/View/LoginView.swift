//
//  LoginView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 04/03/2025.
//

import SwiftUI
import SwiftUICore

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 16) {
                Text("Login")
                    .font(DesignTokens.Typography.titleFont)
                    .foregroundStyle(DesignTokens.Colors.primary)
                    .textCase(.uppercase)
                    .padding(.bottom, 30)
                CustomTextField(placeholder: "Email", text: $viewModel.email)
                CustomSecureField(
                    placeholder: "Password", text: $viewModel.password)
                CustomTextButton(text: "Sign In",
                                 onButtonTapped: viewModel.signIn)
                .alert("Error", isPresented: $viewModel.showErrorMessage) {

                } message: {
                    Text(viewModel.errorMessage ?? "Unknown Error")
                }
            }
            .safeAreaPadding()
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
    LoginView(viewModel: LoginViewModel(coordinator: nil))
}
