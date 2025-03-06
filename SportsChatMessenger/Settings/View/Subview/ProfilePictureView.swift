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
                case .failure:
                    Image(systemName: "photo")
                        .font(.largeTitle)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .imageScale(.large)
                        .frame(
                            width: 150,
                            height: 150
                        )
                        .clipShape(.circle)
                default:
                    ProgressView()
                }
            }
            .padding(.top, 32)
            Text("\(forename) \(surname)")
                .padding(.vertical, 16)
                .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    ProfilePictureView(imageURL: "https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8", forename: "Lindsay", surname: "Lohan")
}

