//
//  MockAstroRepository.swift
//  AstroTests
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

class MockAstroRepository {
    // MARK: - RepositoryProtocol
    
    lazy var configurator: ConfiguratorProtocol = Configurator.shared
    
    // MARK: - Test Properties
    
    var fetchAstronautsCalled = false
}

// MARK: - AstroRepositoryProtocol

extension MockAstroRepository: AstroRepositoryProtocol {
    func fetchAstronauts(with nextPath: String?, filter: Int?) async throws -> AstroListResponse {
        fetchAstronautsCalled = true
        return try TestData.modelFromJSON(with: .astronauts)
    }
}
