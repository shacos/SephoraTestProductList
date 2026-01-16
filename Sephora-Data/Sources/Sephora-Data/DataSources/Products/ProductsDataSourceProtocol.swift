//
//  Untitled.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation

public protocol ProductsDataSourceProtocol {
    func getProducts() -> AnyPublisher<[ProductDTO], APIError>
}
