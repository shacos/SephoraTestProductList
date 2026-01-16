//
//  SwiftUIView.swift
//  Sephora-Presentation
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftData
import SwiftUI
import Sephora_Common
import Sephora_Domain

public struct ProductListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query() private var cachedProducts: [Product]

    @StateObject private var vm = ProductListViewModel()

    @Injected private var router: RouterProtocol
    @Injected private var logger: CustomLoggerProtocol

    let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]

    public init() {}

    public var body: some View {
        if vm.isLoading {
            ProgressView()
                .frame(maxWidth: .infinity)
                .onAppear {
                    if cachedProducts.isEmpty {
                        let products = vm.fetchProducts()
                        saveProductsToCache(products)
                    }
                }
        } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(cachedProducts) { product in
                        Button {
                            router.navigate(to: .productDetailsView(product: product))
                        } label: {
                            VStack {
                                AsyncImage(url: URL(string: product.imageURL.small)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .imageCircle()
                                    case .failure(_):
                                        Image(String(product.id), bundle: .module)
                                            .resizable()
                                            .imageCircle()
                                    @unknown default:
                                        Image(String(product.id), bundle: .module)
                                            .resizable()
                                            .imageCircle()
                                    }
                                }
                                .frame(width: 100, height: 100)
                                .padding()
                                
                                VStack {
                                    Text(product.productName)
                                        .font(.headline.bold())
                                        .foregroundStyle(.white)
                                        .padding(.bottom, 5)
                                    
                                    Text(product.price.formatted(.currency(code: Locale.current.currency?.identifier ?? "EUR")))
                                        .font(.subheadline)
                                        .foregroundStyle(.white.opacity(0.8))
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 200)
                            .clipShape(.rect(cornerRadius: 15))
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.lightBackground)
                            }
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
            .navigationTitle("Product List")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .scrollBounceBehavior(.basedOnSize)
            .onAppear {
                if cachedProducts.isEmpty {
                    let products = vm.fetchProducts()
                    saveProductsToCache(products)
                }
            }
            .alert("Error", isPresented: $vm.showAlert) {
                Button("OK") {}
            } message: {
                Text(vm.alertErrorMessage)
            }
        }
    }
    
    private func saveProductsToCache(_ products: [Product]) {
        for product in products {
            modelContext.insert(product)
        }
        do {
            try modelContext.save()
        } catch {
            logger.error("Failed to save products: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProductListView()
}
