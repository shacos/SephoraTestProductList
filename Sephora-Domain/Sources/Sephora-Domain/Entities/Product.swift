//
//  Product.swift
//  Sephora-Domain
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI
import SwiftData

@Model
public class ProductImage {
    public var small: String
    public var large: String
    
    public init(small: String, large: String) {
        self.small = small
        self.large = large
    }
}

@Model
public class ProductCBrand {
    public var id: String
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

@Model
public class Product: Identifiable, Hashable, Equatable {
    public var id: Int
    public var productName: String
    public var productDescription: String
    public var price: Int
    public var imageURL: ProductImage
    public var cBrand: ProductCBrand
    public var isProductSet: Bool
    public var isSpecialBrand: Bool

    public init(id: Int, productName: String, productDescription: String, price: Int, imageURL: ProductImage, cBrand: ProductCBrand, isProductSet: Bool, isSpecialBrand: Bool) {
        self.id = id
        self.productName = productName
        self.productDescription = productDescription
        self.price = price
        self.imageURL = imageURL
        self.cBrand = cBrand
        self.isProductSet = isProductSet
        self.isSpecialBrand = isSpecialBrand
    }

    public static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    nonisolated(unsafe) public static let example = Product(id: 1, productName: "Test Product", productDescription: "Test Description", price: 199, imageURL: ProductImage(small: "1.jpg", large: "2.jpg"), cBrand: ProductCBrand(id: "1", name: "Test Brand"), isProductSet: false, isSpecialBrand: true)
}
