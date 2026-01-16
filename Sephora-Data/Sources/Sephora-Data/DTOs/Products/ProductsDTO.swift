//
//  ProductsDTO.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Foundation

public struct ProductImageDTO: Codable {
    let small: String
    let large: String
}

public struct ProductCBrandDTO: Codable {
    let id: String
    let name: String
}

public struct ProductDTO: Codable {
    let product_id: Int
    let product_name: String
    let description: String
    let price: Int
    let images_url: ProductImageDTO
    let c_brand: ProductCBrandDTO
    let is_productSet: Bool
    let is_special_brand: Bool
}
