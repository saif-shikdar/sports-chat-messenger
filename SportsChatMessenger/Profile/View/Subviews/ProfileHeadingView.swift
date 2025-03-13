//
//  ProfileHeadingView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 11/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileHeadingView: View {
    let title: String
    let showHideButton: Bool
    let hideSectionTapped: () -> Void
    let editSectionTapped: () -> Void

    var body: some View {
        HStack(spacing: 35) {
            Text(title)
                .font(DesignTokens.Typography.titleFont)
                .foregroundStyle(DesignTokens.Colors.white)
            Spacer()
            if (showHideButton) {
                Button {
                    hideSectionTapped()
                } label: {
                    Image(systemName: "eye")
                        .foregroundStyle(DesignTokens.Colors.white)
                }
            }
            Button {
                editSectionTapped()
            } label: {
                Text("Edit")
                    .textCase(.uppercase)
                    .font(DesignTokens.Typography.bodyFont)
                    .foregroundStyle(DesignTokens.Colors.white)
            }
        }
        .padding(.bottom, 24)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProfileHeadingView(title: "Links",
                       showHideButton: true,
                       hideSectionTapped: {},
                       editSectionTapped: {})
    .background(.black)
}
