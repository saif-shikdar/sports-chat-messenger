//
//  Profile.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 10/03/2025.
//

struct Profile: Hashable, Codable {
    let bio: String
    let bornLocation: String
    let educationField: String
    let educationInstitution: String
    let ethnicity: String
    let homeLocation: String
    let links: [SocialLink] // TODO: This is not being decoded properly
    let profilePictureURL: String
    let publicFields: PublicFields
    let relationshipStatus: String
    let workCompany: String
    let workTitle: String
    
    enum CodingKeys: String, CodingKey {
        case bio
        case bornLocation = "born_location"
        case educationField = "education_field"
        case educationInstitution = "education_institution"
        case ethnicity = "ethnicity"
        case homeLocation = "home_location"
        case links
        case profilePictureURL = "profile_picture_url"
        case publicFields = "public_fields"
        case relationshipStatus = "relationship_status"
        case workCompany = "work_company"
        case workTitle = "work_title"
    }
}
