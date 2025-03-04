//
//  ProfileButtonView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 04/03/2025.
//

import SwiftUICore
import SwiftUI

struct ProfileButtonView: View {
    @ObservedObject var viewModel: ProfileButtonViewModel
    
    var body: some View {
        Button {
            print("Profile Button Tapped!")
        } label: {
            Image(systemName: "person.crop.circle")
        }
        
    }
}
