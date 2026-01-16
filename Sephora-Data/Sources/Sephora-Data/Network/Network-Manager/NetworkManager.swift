//
//  network.swift
//  Sephora-Data
//
//  Created by Mehdi on 12/1/2026.
//

import Combine
import Foundation

public class NetworkManager: NetworkManagerProtocol {

    public init() {}

    public func makeRequest<T: Codable>(with builder: RequestBuilderProtocol, type: T.Type) -> AnyPublisher<T, APIError> {
        let request = builder.build()

        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.main)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: type, decoder: JSONDecoder())
            .mapError { error -> APIError in
                if error is DecodingError {
                    return APIError.parsingError
                } else if let error = error as? APIError {
                    return error
                } else {
                    return APIError.unknownError("Unknown error occured")
                }
            }
            .eraseToAnyPublisher()
    }
}
