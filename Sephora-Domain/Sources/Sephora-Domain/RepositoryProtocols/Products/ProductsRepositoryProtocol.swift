//
//  ProductsRepository.swift
//  Sephora-Domain
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation

public protocol ProductsRepositoryProtocol {
    func getProducts() -> AnyPublisher<[Product], HTTPError>
}
