//
//  SephoraTestApp.swift
//  SephoraTest
//
//  Created by Mehdi on 12/1/2026.
//

import SwiftUI
import Sephora_Domain
import Sephora_Router

@main
struct SephoraTestApp: App {
    let router = Router()
    init() {
        DIContainer.registerDependencies(router: router)
//        DIContainer.validateDependencies()
    }
    var body: some Scene {
        WindowGroup {
            AppNavHandler(router: router)
        }
    }
}
