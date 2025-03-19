//
//  ScrollOffsetPreferenceKey.swift
//  SportsChatMessenger
//
//  Created by Saif Shikdar on 17/03/2025.
//

import SwiftUICore

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}
