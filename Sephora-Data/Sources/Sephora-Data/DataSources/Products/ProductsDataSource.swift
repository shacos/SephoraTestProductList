//
//  ProductsAPIDataSource.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation
import Sephora_Domain

public class ProductsDataSource: ProductsDataSourceProtocol {
    @Injected private var network: NetworkManagerProtocol

    public init() {}

    public func getProducts() -> AnyPublisher<[ProductDTO], APIError> {
        guard let baseURL = URL(string: EndPoints.baseURL.path) else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        let request = RequestBuilder(baseURL: baseURL, path: EndPoints.products.path)
        request.set(headers: Headers.defaultHeader)

        return network.makeRequest(with: request, type: [ProductDTO].self)
            .eraseToAnyPublisher()
    }
}
