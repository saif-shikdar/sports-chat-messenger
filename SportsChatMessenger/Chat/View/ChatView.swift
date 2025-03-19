//
//  ChatView.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 03/03/2025.
//

import SwiftUICore
import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: ChatViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Hello Chat!")
                    .font(DesignTokens.Typography.bodyFont)
                    .foregroundStyle(DesignTokens.Colors.primary)
            }
            .safeAreaPadding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Chat")
                        .font(DesignTokens.Typography.titleFont)
                        .foregroundStyle(DesignTokens.Colors.primary)
                }
            }
            .background {
                Image(Images.backgroundImage)
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
    ChatView(viewModel: ChatViewModel(coordinator: nil))
}
