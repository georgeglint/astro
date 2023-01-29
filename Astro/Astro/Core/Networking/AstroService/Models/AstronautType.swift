//
//  AstronautType.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - AstronautType

struct AstronautType: Decodable, Equatable, Hashable {
    let id: Int?
    let name: AstronautTypeDescription?
}

// MARK: - AstronautTypeDescription

enum AstronautTypeDescription: String, Decodable, Equatable, CaseIterable {
    case unknown = "Unknown"
    case government = "Government"
    case `private` = "Private"
    case passenger = "Non-Astronaut Passenger"
    case payloadSpecialist = "Payload Specialist"
    case nonHuman = "Non-Human"
    case commercial = "Commercial"
    
    var id: Int {
        switch self {
        case .unknown: return 1
        case .government: return 2
        case .private: return 3
        case .passenger: return 4
        case .payloadSpecialist: return 5
        case .nonHuman: return 6
        case .commercial: return 7
        }
    }
}

// MARK: - Mock

extension AstronautType {
    static let mock = AstronautType(id: 2, name: .government)
}
