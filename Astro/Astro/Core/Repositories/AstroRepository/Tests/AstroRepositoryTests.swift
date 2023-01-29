//
//  AstroRepositoryTests.swift
//  AstroTests
//
//  Created by George Leadbeater on 29/01/2023.
//

@testable import Astro
import XCTest

class AstroRepositoryTests: XCTestCase {
    // MARK: - Properties
    
    var astroRepository: AstroRepository!
    var astroService: MockAstroService!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        astroRepository = AstroRepository()
        astroService = MockAstroService()
        astroRepository.service = astroService
    }
    
    // MARK: - Test Methods
    
    func testWhenFetchAstronauts_ThenRequestConstructedCorrectly() async throws {
        let endpoint = Constants.baseURL + AstroRepository.Path.astronaut.rawValue
        let mockRequestConstructor = RequestConstructor(endpoint: endpoint,
                                                        httpMethod: .GET,
                                                        queryItems: [URLQueryItem(name: Constants.queryParam.0,
                                                                                  value: Constants.queryParam.1)],
                                                        modifier: {
            $0.acceptingJSON()
        })
        
        _ = try await astroRepository.fetchAstronauts(with: nil, filter: nil)
        
        XCTAssertTrue(astroService.fetchAstronautsCalled)
        XCTAssertEqual(astroService.fetchAstronautsConstructor?.endpoint, mockRequestConstructor.endpoint)
        XCTAssertEqual(astroService.fetchAstronautsConstructor?.httpMethod, mockRequestConstructor.httpMethod)
        XCTAssertEqual(astroService.fetchAstronautsConstructor?.queryItems, mockRequestConstructor.queryItems)
    }
}

// MARK: - Constants

extension AstroRepositoryTests {
    private struct Constants {
        static let baseURL = Configurator.shared.configuration?.baseURL ?? ""
        static let queryParam: (String, String) = ("limit", "10")
    }
}
