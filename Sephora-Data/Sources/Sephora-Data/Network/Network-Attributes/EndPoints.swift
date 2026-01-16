//
//  EndPoints.swift
//  Sephora-Data
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation

enum EndPoints {
    case baseURL
    case products
}

extension EndPoints {
    var path: String {
        switch self {
        case .baseURL:
            "https://sephoraios.github.io"
        case .products:
            "/items.json"
        }
    }
}
