//
//  ProductsMapper.swift
//  Sephora-Data
//
//  Created by Mehdi on 13/1/2026.
//

import Foundation
import Sephora_Domain

class ProductsMapper {
    static func map(productDTO: ProductDTO) -> Product {
        let productImage = ProductImage(
            small: productDTO.images_url.small,
            large: productDTO.images_url.large
        )
        
        let productCBrand = ProductCBrand(
            id: productDTO.c_brand.id,
            name: productDTO.c_brand.name
        )

        return Product(
            id: productDTO.product_id,
            productName: productDTO.product_name,
            productDescription: productDTO.description,
            price: productDTO.price,
            imageURL: productImage,
            cBrand: productCBrand,
            isProductSet: productDTO.is_productSet,
            isSpecialBrand: productDTO.is_special_brand
        )
    }
}
