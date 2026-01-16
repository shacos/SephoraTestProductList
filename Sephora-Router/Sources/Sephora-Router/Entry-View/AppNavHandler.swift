//
//  AppNavHandler.swift
//  Sephora-Router
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI
import SwiftData
import Sephora_Domain
import Sephora_Presentation

public struct AppNavHandler: View {
    @State private var router: RouterProtocol

    public init(router: RouterProtocol) {
        self.router = router
    }

    public var body: some View {
        let firstView: Routes = .productsView
        NavigationStack(path: $router.path) {
            firstView
                .navigationConfig()
        }
        .modelContainer(for: Product.self)
    }
}
