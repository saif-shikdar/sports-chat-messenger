//
//  ProfileView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 05/03/2025.
//

import SwiftUI
import SwiftUICore

struct ProfileView: View {

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Hello Profile!")
            }
            .safeAreaPadding()
            .background {
                Image("light-background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
            }
        }

    }
}

#Preview {
    ProfileView()
}
