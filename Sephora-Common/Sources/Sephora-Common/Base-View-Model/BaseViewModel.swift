//
//  BaseViewModel.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import SwiftUI

open class BaseViewModel: ObservableObject {
    @Published public var isLoading = false
    @Published public var showAlert = false
    @Published public var alertErrorMessage = ""
    public var loadingStatus: LoadingState = .finished {
        didSet {
            switch loadingStatus {
            case .loading:
                isLoading = true
                showAlert = false
                alertErrorMessage = ""
            case .failure(let error):
                isLoading = true
                showAlert = true
                alertErrorMessage = error
            case .finished:
                isLoading = false
                showAlert = false
                alertErrorMessage = ""
            }
        }
    }

    public init() {}
}
