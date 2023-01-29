//
//  AstronautLink.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

struct AstronautLink: Equatable {
    let name: String
    let url: String?
}

// MARK: - Mock

extension AstronautLink {
    static let mock = AstronautLink(name: L10n.nInstagram, url: Astronaut.mock.instagram)
}
