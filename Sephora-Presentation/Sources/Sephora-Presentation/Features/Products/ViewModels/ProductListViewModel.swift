//
//  File.swift
//  Sephora-Presentation
//
//  Created by Mehdi on 13/1/2026.
//

import Combine
import SwiftUI
import SwiftData
import Sephora_Common
import Sephora_Domain

public class ProductListViewModel: BaseViewModel {
    @Injected private var getAllProductsSpecialBrandFirstUseCase: GetAllProductsSpecialBrandFirstUseCaseProtocol
    @Injected private var logger: CustomLoggerProtocol

    private var products: [Product] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() -> [Product] {
        loadingStatus = .loading
        logger.debug("loadingStatus is \(loadingStatus)")

        getAllProductsSpecialBrandFirstUseCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else { return }

                switch completion {
                case .finished:
                    self.logger.verbose("finished and the loadingStatus is \(self.loadingStatus)")
                    self.loadingStatus = .finished
                case .failure(let error):
                    self.logger.error("the error is \(error.localizedDescription)")
                    self.loadingStatus = .failure(error: error.localizedDescription)
                }
            } receiveValue: { [weak self] products in
                guard let self = self else { return }

                self.logger.info("products are \(products)")
                self.products = products
            }
            .store(in: &cancellables)

        return products
    }
}
