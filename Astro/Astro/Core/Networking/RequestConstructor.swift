//
//  RequestConstructor.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

typealias RequestModifier = ((URLRequest) -> URLRequest)

struct RequestConstructor {
    let endpoint: String
    let httpMethod: HTTPMethod
    var body: [String: Any]?
    var queryItems: [URLQueryItem]?
    let modifier: RequestModifier
}
