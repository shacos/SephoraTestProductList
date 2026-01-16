//
//  DIConfig.swift
//  SephoraTest
//
//  Created by Mehdi on 13/1/2026.
//

import Foundation
import Swinject
import Sephora_Common
import Sephora_Data
import Sephora_Domain
import Sephora_Router
import Sephora_Presentation

extension DIContainer {
    public static func registerDependencies(router: Router) {
        let container = DIContainer.shared.container

// MARK: - REGISTER UTILITIES
        container.register(CustomLoggerProtocol.self) { _ in
            CustomLogger()
        }
        
// MARK: - REGISTER DATA LAYERS
        container.register(NetworkManagerProtocol.self) { _ in
            NetworkManager()
        }
        container.register(ProductsDataSourceProtocol.self) { _ in
            ProductsDataSource()
        }
        container.register(ProductsRepositoryProtocol.self) { _ in
            ProductsRepository()
        }

// MARK: - REGISTER ROUTER LAYER
        container.register(RouterProtocol.self) { _ in
            router
        }

// MARK: - REGISTER DOMAIN LAYER
        container.register(GetAllProductsUseCaseProtocol.self) { _ in
            GetAllProductsUseCase()
        }
        container.register(GetAllProductsSpecialBrandFirstUseCaseProtocol.self) { _ in
            GetAllProductsSpecialBrandFirstUseCase()
        }
    }

//    public static func validateDependencies() {
//        let container = DIContainer.shared.container
//
//        let dependencies: [() -> Any?] = [
//            { container.resolve(CustomLoggerProtocol.self) },
//            { container.resolve(NetworkManagerProtocol.self) },
//            { container.resolve(ProductsDataSourceProtocol.self) },
//            { container.resolve(ProductsRepositoryProtocol.self) },
//            { container.resolve(GetAllProductsUseCaseProtocol.self) }
//        ]
//
//        for resolve in dependencies {
//            guard resolve() != nil else {
//                fatalError("One or more dependencies are not registered in the container.")
//            }
//        }
//
//        print("All dependencies are successfully registered.")
//    }
}
