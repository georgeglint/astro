//
//  AstroDetailViewModel.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

final class AstroDetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published private(set) var photoURL: String
    @Published private(set) var name: String
    @Published private(set) var agency: String
    @Published private(set) var dateOfBirth: String
    @Published private(set) var links: [AstronautLink]
    @Published private(set) var biography: String
    
    // MARK: - Lifecycle
    
    init(astronaut: Astronaut) {
        photoURL = astronaut.profileImage ?? ""
        name = astronaut.name ?? ""
        agency = astronaut.agency?.name ?? ""
        dateOfBirth = astronaut.dateOfBirth ?? ""
        biography = astronaut.bio ?? ""
        
        links = [
            AstronautLink(name: L10n.nInstagram, url: astronaut.instagram),
            AstronautLink(name: L10n.nTwitter, url: astronaut.twitter),
            AstronautLink(name: L10n.nWikipedia, url: astronaut.wiki)
        ].filter { $0.url != nil }
    }
}
