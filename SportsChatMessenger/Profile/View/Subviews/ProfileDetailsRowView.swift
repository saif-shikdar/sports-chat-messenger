//
//  ProfileDetailsRowView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 11/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileDetailsRowView: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        HStack(spacing: 24) {
            Image(systemName: icon)
                .foregroundStyle(DesignTokens.Colors.white)
                .frame(width: 20, alignment: .center)
            createTextView(title: title,
                           subtitle: subtitle)
            Spacer()
            Button {
                print("Hide Section Tapped!")
            } label: {
                Image(systemName: "eye")
                    .foregroundStyle(DesignTokens.Colors.white)
            }
        }
        .padding(.bottom, 24)
    }
}

@ViewBuilder
func createTextView(title: String, subtitle: String) -> some View {
    if (subtitle.isEmpty) {
        Text(title)
            .font(DesignTokens.Typography.bodyFont)
            .foregroundStyle(DesignTokens.Colors.secondary)
    } else {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(DesignTokens.Typography.bodyFont)
                .foregroundStyle(DesignTokens.Colors.white)
            Text(subtitle)
                .font(DesignTokens.Typography.captionFont)
                .foregroundStyle(DesignTokens.Colors.white)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProfileDetailsRowView(title: "Amazon",
                          subtitle: "",
                          icon: "briefcase.fill")
    .background(.black)
}
