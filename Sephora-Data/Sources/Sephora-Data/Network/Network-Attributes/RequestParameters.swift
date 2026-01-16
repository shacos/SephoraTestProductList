//
//  RequestParameters.swift
//  Sephora-Common
//
//  Created by Mehdi on 12/1/2026.
//

import Foundation

public enum RequestParameters {
    case body(_: [String: Any]?)
    case url(_: [String: String]?)
}
