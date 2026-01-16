//
//  ProductRepository.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation
import Sephora_Domain

public class ProductsRepository: ProductsRepositoryProtocol {
    @Injected private var productDataSource: ProductsDataSourceProtocol
    var cancellables = Set<AnyCancellable>()
    
    public init() {}

    public func getProducts() -> AnyPublisher<[Product], HTTPError> {
        return productDataSource.getProducts()
            .map { productDTOs in
                productDTOs.map {
                    ProductsMapper.map(productDTO: $0)
                }
            }
            .mapError { apiError in
                switch apiError {
                case .invalidResponse:
                    return HTTPError.networkError
                case .invalidURL:
                    return HTTPError.productUnavailable
                case .parsingError:
                    return HTTPError.productUnavailable
                case .unknownError(let error):
                    return HTTPError.unknownError(error)
                }
            }
            .eraseToAnyPublisher()
    }
}
