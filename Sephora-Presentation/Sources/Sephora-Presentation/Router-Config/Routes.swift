//
//  Route.swift
//  Sephora-Router
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI
import Sephora_Domain

public enum Routes: Hashable {
    case productsView
    case productDetailsView(product: Product)
    
    public static func == (lhs: Routes, rhs: Routes) -> Bool {
        switch (lhs, rhs) {
        case (.productsView, .productsView):
            return true
        case let (.productDetailsView(product1), .productDetailsView(product2)):
            return product1.id == product2.id
        default:
            return false
        }
    }
    
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .productsView:
            hasher.combine(0)
        case let .productDetailsView(product):
            hasher.combine(product.id)
        }
    }
}

extension Routes: View {
    public var body: some View {
        switch self {
        case .productsView:
            ProductListView()
        case let .productDetailsView(product):
            ProductDetailsView(product: product)
        }
    }
}
