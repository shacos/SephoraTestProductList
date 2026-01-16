//
//  GetAllProductsSpecialBrandFirstUseCaseProtocol.swift
//  Sephora-Domain
//
//  Created by Mehdi on 15/1/2026.
//

import Combine
import Foundation

public protocol GetAllProductsSpecialBrandFirstUseCaseProtocol {
    func execute() -> AnyPublisher<[Product], HTTPError>
}
