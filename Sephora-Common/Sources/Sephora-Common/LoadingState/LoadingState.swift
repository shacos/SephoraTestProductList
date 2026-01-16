//
//  LoadingState.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import SwiftUI

public enum LoadingState: Equatable {
    case loading
    case finished
    case failure(error: String)
}
