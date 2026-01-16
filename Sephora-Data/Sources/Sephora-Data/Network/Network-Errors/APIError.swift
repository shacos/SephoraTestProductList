//
//  APIError.swift
//  Sephora-Data
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation

public enum APIError: Error {
    case invalidURL
    case invalidResponse
    case parsingError
    case unknownError(String)
}
