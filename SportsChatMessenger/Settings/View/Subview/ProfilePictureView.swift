//
//  ProfilePictureView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 06/03/2025.
//

import SwiftUICore
import SwiftUI

struct ProfilePictureView: View {
    let imageURL: String
    let forename: String
    let surname: String

    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: imageURL)
            ) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .imageScale(.medium)
                        .frame(
                            width: 150,
                            height: 150
                        )
                        .clipShape(.circle)
                default:
                    ProgressView()
                        .frame(
                            width: 150,
                            height: 150
                        )
                }
            }
            .padding(.top, 32)
            Text("\(forename) \(surname)")
                .padding(.vertical, 16)
                .font(DesignTokens.Typography.titleFont)
                .foregroundStyle(DesignTokens.Colors.primary)
        }
    }
}

#Preview {
    ProfilePictureView(imageURL: "https://www.fifatrainingcentre.com/media/images/game/World-class-bellingham.variant1920x1080.jpg",
                       forename: "Jude",
                       surname: "Bellingham")
}

