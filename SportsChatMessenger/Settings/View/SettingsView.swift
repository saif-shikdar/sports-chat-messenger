//
//  SettingsView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftUICore
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Hello Settings!")
                    .foregroundStyle(.white)
            }
            .safeAreaPadding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .foregroundStyle(.white)
                }
            }
            .background {
                Image("dark-background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height)
            }
        }
    }
}
