//
//  RequestError.swift
//  Sephora-Domain
//
//  Created by Mehdi on 13/1/2026.
//

import Foundation

public enum HTTPError: Error {
    case productUnavailable
    case networkError
    case unknownError(String)
}
