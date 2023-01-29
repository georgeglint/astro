//
//  AstroRepository.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - AstroRepositoryProtocol

protocol AstroRepositoryProtocol: RepositoryProtocol {
    func fetchAstronauts(with nextPath: String?, filter: Int?) async throws -> AstroListResponse
}

// MARK: - AstroRepository

struct AstroRepository {
    // MARK: - RepositoryProtocol
    
    var service: AstroServiceProtocol = AstroService()
    var configurator: ConfiguratorProtocol = Configurator.shared
    
    // MARK: - Enums
    
    enum Path: String {
        case astronaut = "/2.2.0/astronaut/"
    }
}

// MARK: - AstroRepositoryProtocol

extension AstroRepository: AstroRepositoryProtocol {
    func fetchAstronauts(with nextPath: String?, filter: Int?) async throws -> AstroListResponse {
        let isFirstPage = nextPath == nil
        let endpoint = isFirstPage ? baseURL + Path.astronaut.rawValue : (nextPath ?? "")
        var queryItems = isFirstPage ? [URLQueryItem(name: Constants.limit.0, value: Constants.limit.1)] : nil
        
        if let filter {
            queryItems?.append(URLQueryItem(name: Constants.typeFilterKey, value: String(describing: filter)))
        }
        
        let requestConstructor = RequestConstructor(endpoint: endpoint,
                                                    httpMethod: .GET,
                                                    queryItems: queryItems,
                                                    modifier: {
            $0.acceptingJSON()
        })
        
        return try await service.fetchAstronauts(with: requestConstructor)
    }
}

// MARK: - Constants

extension AstroRepository {
    private struct Constants {
        static let limit: (String, String) = ("limit", "10")
        static let typeFilterKey: String = "type__id"
    }
}
