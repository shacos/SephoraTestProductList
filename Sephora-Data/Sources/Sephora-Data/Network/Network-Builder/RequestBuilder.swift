//
//  RequestBuilder.swift
//  Sephora-Data
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation

public final class RequestBuilder: RequestBuilderProtocol {
    private var baseURL: URL
    private var path: String
    private var method: HTTPMethod = .get
    private var headers: [String: String]?
    private var parameters: RequestParameters?

    public init(baseURL: URL, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
    
    @discardableResult
    public func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    @discardableResult
    public func set(path: String) -> Self {
        self.path = path
        return self
    }
    
    @discardableResult
    public func set(headers: [String : String]?) -> Self {
        self.headers = headers
        return self
    }
    
    @discardableResult
    public func set(parameters: RequestParameters) -> Self {
        self.parameters = parameters
        return self
    }
    
    public func build() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        print("the baseURL.absoluteString is: \(baseURL.absoluteString)")
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 50)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        setupBodyData(urlRequest: &urlRequest)
        print("the urlRequest is: \(urlRequest)")
        return urlRequest
    }
    
    private func setupBodyData(urlRequest: inout URLRequest) {
        guard let parameters = parameters else { return }
        
        switch parameters {
        case .body(let bodyParam):
            setupRequestBody(bodyParam, for: &urlRequest)
        case .url(let urlParam):
            setupRequestURLBody(urlParam, for: &urlRequest)
        }
    }
    
    private func setupRequestBody(_ parameters: [String: Any]?, for request: inout URLRequest) {
        guard let parameters = parameters else { return }
        
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = data
    }
    
    private func setupRequestURLBody(_ parameters: [String: String]?, for request: inout URLRequest) {
        guard let parameters = parameters, let url = request.url, var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        
        urlComponents.queryItems = parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        request.url = urlComponents.url
    }
}
