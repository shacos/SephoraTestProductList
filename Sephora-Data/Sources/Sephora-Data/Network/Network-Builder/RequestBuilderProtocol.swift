//
//  RequestBuilder.swift
//  Sephora-Data
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation

public protocol RequestBuilderProtocol {
    init(baseURL: URL, path: String)
    
    @discardableResult
    func set(method: HTTPMethod) -> Self
    
    @discardableResult
    func set(path: String) -> Self
    
    @discardableResult
    func set(headers: [String: String]?) -> Self
    
    @discardableResult
    func set(parameters: RequestParameters) -> Self
    
    func build() -> URLRequest
}
