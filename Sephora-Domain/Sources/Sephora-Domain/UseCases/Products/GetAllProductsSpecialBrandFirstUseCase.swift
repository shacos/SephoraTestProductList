//
//  GetAllProductsSpecialBrandFirstUseCase.swift
//  Sephora-Domain
//
//  Created by Mehdi on 15/1/2026.
//

import Combine
import Foundation

public class GetAllProductsSpecialBrandFirstUseCase: GetAllProductsSpecialBrandFirstUseCaseProtocol {
    @Injected public var productsRepository: ProductsRepositoryProtocol

    public init() {}

    public func execute() -> AnyPublisher<[Product], HTTPError> {
        return productsRepository.getProducts()
            .map { products in
                products.sorted { product1, product2 in
                    if product1.isSpecialBrand && !product2.isSpecialBrand {
                        return true
                    } else if !product1.isSpecialBrand && product2.isSpecialBrand {
                        return false
                    }
                    return product1.productName < product2.productName
                }
            }
            .eraseToAnyPublisher()
    }
}
