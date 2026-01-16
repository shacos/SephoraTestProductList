//
//  NavigationModifier.swift
//  Sephora-Common
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI
import Sephora_Presentation

public struct NavigationModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .navigationDestination(for: Routes.self) { route in
                switch route {
                case .productsView:
                    ProductListView()
                case let .productDetailsView(product: product):
                    ProductDetailsView(product: product)
                }
            }
    }
}

extension View {
    public func navigationConfig() -> some View {
        self.modifier(NavigationModifier())
    }
}
