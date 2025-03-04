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
            }
            .safeAreaPadding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Chat")
                }
            }
            
        }
        
    }
}
