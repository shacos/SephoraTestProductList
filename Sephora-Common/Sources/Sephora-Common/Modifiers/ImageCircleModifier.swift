//
//  Untitled.swift
//  Sephora-Common
//
//  Created by Mehdi on 15/1/2026.
//

import SwiftUI

public struct ImageCircleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipShape(Circle())
    }
}

extension View {
    public func imageCircle() -> some View {
        modifier(ImageCircleModifier())
    }
}
