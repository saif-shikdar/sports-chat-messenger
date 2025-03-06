//
//  SettingsButtonView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 06/03/2025.
//

import SwiftUICore
import SwiftUI

struct SettingsButtonView: View {
    let iconName: String
    let text: String
    let onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            Button {
                onButtonTap()
            } label: {
                HStack {
                    Image(systemName: iconName)
                    Spacer()
                    Text(text)
                        .textCase(.uppercase)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            Divider()
        }
    }
}

#Preview {
    SettingsButtonView(iconName: "person.fill",
                       text: "Profile",
                       onButtonTap: {})
}
