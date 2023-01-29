//
//  APIError.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

enum APIError: Error {
    case decoding(DecodingError)
    case descriptiveError(description: String, code: Int)
    case network(URLError)
    case nonHTTPResponse
    case unableToSerialize
    case unableToDeserialize(description: String)
    case unexpectedStatusCode(Int)
    case unknown(Error)
}
