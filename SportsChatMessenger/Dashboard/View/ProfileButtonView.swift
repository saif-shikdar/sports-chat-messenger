//
//  ProfileButtonView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 04/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileButtonView: View {
    let imageURL: String
    let buttonTapped: () -> Void

    var body: some View {
        Button {
            buttonTapped()
        } label: {
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .imageScale(.small)
                        .frame(width: 35, height: 35)
                        .clipShape(.circle)
                default:
                    ProgressView()
                }
            }
        }
    }
}

#Preview {
    ProfileButtonView(
        imageURL:
            "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8",
        buttonTapped: {})
}
