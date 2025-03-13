//
//  SocialLinkType.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 13/03/2025.
//

enum SocialLinkType: String, Codable {
    case discord
    case facebook
    case instagram
    case twitter
    case youtube
    case tiktok
    case playstation
    case snapchat
    case spotify
    case other

    var icon: String {
        switch self {
        case .discord:
            Images.discordLogo
        case .facebook:
            Images.facebookLogo
        case .instagram:
            Images.instagramLogo
        case .twitter:
            Images.twitterLogo
        case .youtube:
            Images.youtubeLogo
        case .tiktok:
            Images.tiktokLogo
        case .playstation:
            Images.playstationLogo
        case .snapchat:
            Images.snapchatLogo
        case .spotify:
            Images.spotifyLogo
        case .other:
            Images.linkIcon
        }
    }

    init(from decoder: Decoder) throws {
        guard
            let value = try? decoder.singleValueContainer().decode(String.self)
        else {
            self = .other
            return
        }
        self = SocialLinkType(rawValue: value) ?? .other
    }
}
