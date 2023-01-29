//
//  MockAstroService.swift
//  AstroTests
//
//  Created by George Leadbeater on 29/01/2023.
//

@testable import Astro
import XCTest

class MockAstroService {
    // MARK: - AstroServiceProtocol
    
    var session: URLSession = .shared
    
    // MARK: - Test Properties
    
    var fetchAstronautsCalled = false
    var fetchAstronautsConstructor: RequestConstructor?
}

// MARK: - AstroServiceProtocol

extension MockAstroService: AstroServiceProtocol {
    func fetchAstronauts(with constructor: RequestConstructor) async throws -> AstroListResponse {
        fetchAstronautsCalled = true
        fetchAstronautsConstructor = constructor
        
        let mockJSONData = try XCTUnwrap(TestData.loadJSON(with: .astronauts))
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(AstroListResponse.self, from: mockJSONData)
    }
}
