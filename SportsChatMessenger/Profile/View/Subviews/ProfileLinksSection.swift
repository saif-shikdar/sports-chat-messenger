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
                    Button {
                        if let url = URL(string: link.linkURL) {
                            UIApplication.shared.open(url)
                        }
                    } label: {
//                        Image(link.name.icon)
//                            .resizable()
//                            .frame(width: 25, height: 25)
                    }
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
//            name: .playstation,
            linkURL: "https://psntrophyleaders.com/user/view/saifshikdar#games"),
        SocialLink(
//            name: .instagram,
            linkURL: "https://www.instagram.com/judebellingham/?hl=en"),
    ])
}
