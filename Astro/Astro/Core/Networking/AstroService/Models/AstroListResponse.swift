//
//  AstroListResponse.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

struct AstroListResponse: Decodable, Equatable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Astronaut]?
}
