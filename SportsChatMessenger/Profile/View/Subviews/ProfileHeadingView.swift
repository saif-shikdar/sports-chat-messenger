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
                .foregroundStyle(.white)
            Spacer()
            if (showHideButton) {
                Button {
                    hideSectionTapped()
                } label: {
                    Image(systemName: "eye")
                }
            }
            Button {
                editSectionTapped()
            } label: {
                Text("Edit")
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
}
