//
//  GetAllProductsUserCaseProtocol.swift
//  Sephora-Domain
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation

public protocol GetAllProductsUseCaseProtocol {
    func execute() -> AnyPublisher<[Product], HTTPError>
}
