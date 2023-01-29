//
//  AstroServiceTests.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

@testable import Astro
import XCTest

class AstroServiceTests: XCTestCase {
    // MARK: - Properties
    
    var astroService: AstroService!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        astroService = AstroService()
        astroService.session = Constants.urlSession
        MockURLProtocol.error = nil
        MockURLProtocol.requestHandler = nil
    }
    
    // MARK: - Test Methods
    
    func testWhenFetchAstronauts_ThenResponseIsEqual() async throws {
        let mockJSONData = try XCTUnwrap(TestData.loadJSON(with: .astronauts))
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let mockResponse = try decoder.decode(AstroListResponse.self, from: mockJSONData)
        
        MockURLProtocol.requestHandler = { _ in
            let response = try XCTUnwrap(HTTPURLResponse())
            return (response, mockJSONData)
        }
        
        let response = try await astroService.fetchAstronauts(with: Constants.mockRequestConstructor)
        
        XCTAssertNotNil(response)
        XCTAssertEqual(response, mockResponse)
    }
}

// MARK: - Constants

extension AstroServiceTests {
    private struct Constants {
        static let urlSession: URLSession = {
            let configuration = URLSessionConfiguration.ephemeral
            configuration.protocolClasses = [MockURLProtocol.self]
            return URLSession(configuration: configuration)
        }()
        static let mockRequestConstructor = RequestConstructor(endpoint: "",
                                                               httpMethod: .GET,
                                                               modifier: { $0 })
    }
}
