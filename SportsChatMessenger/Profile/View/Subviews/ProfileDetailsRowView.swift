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
                .foregroundStyle(.white)
            createTextView(title: title,
                           subtitle: subtitle)
            Spacer()
            Button {
                print("Hide Section Tapped!")
            } label: {
                Image(systemName: "eye")
            }
        }
        .padding(.bottom, 24)
    }
}

@ViewBuilder
func createTextView(title: String, subtitle: String) -> some View {
    if (subtitle.isEmpty) {
        Text(title)
            .foregroundStyle(.white)
    } else {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.white)
            Text(subtitle)
                .foregroundStyle(.white)
                .font(.caption)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProfileDetailsRowView(title: "Amazon",
                          subtitle: "Software Developer",
                          icon: "briefcase.fill")
}
