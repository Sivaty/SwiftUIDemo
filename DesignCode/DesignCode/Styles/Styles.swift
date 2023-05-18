//
//  Styles.swift
//  DesignCode
//
//  Created by Link on 2022/7/24.
//

import SwiftUI

struct StrokeModofier: ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(.linearGradient(colors: [
                    .white.opacity(colorScheme == .light ? 0.3 : 0.1),
                    .black.opacity(colorScheme == .light ? 0.1 : 0.3)],
                    startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30.0) -> some View {
        modifier(StrokeModofier(cornerRadius: cornerRadius))
    }
}
