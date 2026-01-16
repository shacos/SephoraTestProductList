//
//  Router.swift
//  Sephora-Router
//
//  Created by Mehdi on 13/1/2026.
//

import SwiftUI
import Sephora_Presentation

@Observable
public class Router: RouterProtocol {
    public var path = NavigationPath()
    
    public init() {}

    public func navigate(to route: Routes) {
        path.append(route)
    }

    public func navigateBack() {
        path.removeLast()
    }

    public func navigateToRoot() {
        path.removeLast(path.count)
    }

    public func popToView(count: Int) {
        path.removeLast(count)
    }
}
