//
//  User.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 10/03/2025.
//

struct User: Codable {
    let forename: String
    let surname: String
    let email: String
    let userID: String
    let profilePictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case forename
        case surname
        case email
        case userID = "uid"
        case profilePictureURL = "profile_picture_url"
    }
}
