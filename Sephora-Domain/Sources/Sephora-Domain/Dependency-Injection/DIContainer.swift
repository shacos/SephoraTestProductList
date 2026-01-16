//
//  Dependencies.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation
import Swinject

final public class DIContainer {
    nonisolated(unsafe) public static let shared: DIContainer = DIContainer()
    public let container: Container = Container()
    
    public init() {}
}

@propertyWrapper
public struct Injected<Dependency> {
    public let wrappedValue: Dependency

    public init() {
        wrappedValue = DIContainer.shared.container.resolve(Dependency.self)!
    }
}
