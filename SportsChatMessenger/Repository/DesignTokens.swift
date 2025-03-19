//
//  DesignTokens.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 12/03/2025.
//

import SwiftUICore

struct DesignTokens {
    struct Colors {
        static let primary = Color("PrimaryColor")
        static let secondary = Color("SecondaryColor")
        static let background = Color("BackgroundColor")
        static let white = Color.white
        static let black = Color.black
    }

    struct Typography {
        static let titleFont = Font.system(size: 20, weight: .bold)
        static let bodyFont = Font.system(size: 16, weight: .regular)
        static let captionFont = Font.system(size: 12, weight: .light)
        static let buttonFont = Font.system(size: 18, weight: .semibold)
    }
}
