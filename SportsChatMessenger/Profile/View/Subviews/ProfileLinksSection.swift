//
//  ProfileLinksSection.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 11/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileLinksSection: View {
    let socialLinks: [SocialLink]

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(socialLinks, id: \.self) { link in
                    Image(link.icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                Spacer()
            }
            .padding(16)
        }
        .padding(.bottom, 24)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ProfileLinksSection(socialLinks: [
        SocialLink(
            name: "Playstation",
            icon: Images.playstationLogo,
            linkURL: "https://psntrophyleaders.com/user/view/saifshikdar#games"),
        SocialLink(
            name: "Instagram",
            icon: Images.instagramLogo,
            linkURL: "https://www.instagram.com/judebellingham/?hl=en"),
    ])
}
