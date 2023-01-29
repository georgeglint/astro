//
//  AstroService.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - AstroServiceProtocol

protocol AstroServiceProtocol: APIServiceProtocol {
    func fetchAstronauts(with constructor: RequestConstructor) async throws -> AstroListResponse
}

// MARK: - AstroService

struct AstroService {
    // MARK: - APIServiceProtocol
    
    var session: URLSession = .shared
}

// MARK: - AstroServiceProtocol

extension AstroService: AstroServiceProtocol {
    func fetchAstronauts(with constructor: RequestConstructor) async throws -> AstroListResponse {
        try await task(with: constructor)
    }
}
