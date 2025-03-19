//
//  CustomButton.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 12/03/2025.
//

import SwiftUI
import SwiftUICore

struct CustomTextButton: View {
    let text: String
    let onButtonTapped: () -> Void

    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            Text(text)
                .textCase(.uppercase)
                .padding(.vertical, 12)
                .padding(.horizontal, 24)
                .font(DesignTokens.Typography.buttonFont)
                .foregroundStyle(DesignTokens.Colors.secondary)
        }
        .background(DesignTokens.Colors.primary)
        .clipShape(Capsule())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CustomTextButton(text: "Submit",
                     onButtonTapped: {})
}
