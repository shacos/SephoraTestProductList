//
//  SwiftUIView.swift
//  Sephora-Presentation
//
//  Created by Mehdi on 15/1/2026.
//

import SwiftUI
import Sephora_Domain

public struct ProductDetailsView: View {
    public let product: Product
    
    public init(product: Product) {
        self.product = product
    }

    public var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: product.imageURL.large), scale: 4) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure(_):
                        Image(String(product.id), bundle: .module)
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image(String(product.id), bundle: .module)
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                Text(product.productDescription)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("Price: \(product.price.formatted(.currency(code: Locale.current.currency?.identifier ?? "EUR")))")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
                Text(product.cBrand.name)
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                
                Text(product.isProductSet ? "Product Set" : "Single Product")
                    .font(.caption)
                    .foregroundStyle(.white)
                
                product.isSpecialBrand ? Image(systemName: "crown.fill")
                    .resizable()
                    .scaledToFit()
                    .tint(.yellow): nil
            }
        }
        .navigationTitle(product.productName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductDetailsView(product: Product.example)
}
