//
//  NetworkProtocol.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import Foundation

public protocol NetworkManagerProtocol {
    func makeRequest<T: Codable>(with builder: RequestBuilderProtocol, type: T.Type) -> AnyPublisher<T, APIError>
}
