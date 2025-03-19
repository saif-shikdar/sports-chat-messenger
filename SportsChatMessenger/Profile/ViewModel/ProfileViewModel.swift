//
//  ProfileViewModel.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 11/03/2025.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    
    @Published var showErrorMessage: Bool = false
    @Published var errorMessage: String?
    
    let sessionStorage: SessionStorage
    
    init(sessionStorage: SessionStorage = SessionStorage(),
         profile: Profile? = nil) {
        self.sessionStorage = sessionStorage
        self.profile = profile
    }
    
    func hideLinksTapped() {
        print("Hide Links Tapped!")
        print(profile?.links.first?.name.rawValue ?? "Unknown")
    }
    
    func editLinksTapped() {
        print("Edit Links Tapped!")
    }
}
