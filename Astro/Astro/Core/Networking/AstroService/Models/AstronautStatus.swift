//
//  AstronautStatus.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - AstronautStatus

struct AstronautStatus: Decodable, Equatable {
    let id: Int?
    let name: String?
}

// MARK: - Mock

extension AstronautStatus {
    static let mock = AstronautStatus(id: 1, name: "Active")
}
