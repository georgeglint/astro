//
//  Configuration.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

struct Configuration: Decodable {
    let baseURL: String
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
    }
}
