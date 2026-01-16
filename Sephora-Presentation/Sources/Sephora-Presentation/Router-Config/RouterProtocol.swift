//
//  RouterProtocol.swift
//  Sephora-Router
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI

public protocol RouterProtocol {
    var path: NavigationPath { get set }

    func navigate(to route: Routes)
    func navigateBack()
    func navigateToRoot()
    func popToView(count: Int)
}
