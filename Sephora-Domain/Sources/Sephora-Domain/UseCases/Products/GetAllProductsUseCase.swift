//
//  GetAllProductsUseCase.swift
//  Sephora-Domain
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation

public class GetAllProductsUseCase: GetAllProductsUseCaseProtocol {
    @Injected public var productsRepository: ProductsRepositoryProtocol
    
    public init() {}
    
    public func execute() -> AnyPublisher<[Product], HTTPError> {
        return productsRepository.getProducts()
            .eraseToAnyPublisher()
    }
}
