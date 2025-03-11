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
    
    func fetchData() async {
        guard let userID = sessionStorage.userID else {
            self.errorMessage = "Unable to fetch user profile. Please try again later."
            self.showErrorMessage = true;
            return
        }
        
//        await settingsService.getUserData(userID: userID) { result in
//            switch result {
//            case .success(let user):
//                self.user = user
//            case .failure(let error):
//                self.errorMessage = error.localizedDescription
//                self.showErrorMessage = true;
//            }
//        }
    }
    
    func hideLinksTapped() {
        print("Hide Links Tapped!")
    }
    
    func editLinksTapped() {
        print("Edit Links Tapped!")
    }
}
