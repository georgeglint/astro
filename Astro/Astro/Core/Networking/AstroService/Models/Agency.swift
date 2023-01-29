//
//  Agency.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - Agency

struct Agency: Decodable, Equatable {
    let id: Int?
    let url: String?
    let name: String?
    let featured: Bool?
    let type, countryCode, abbrev, description: String?
    let administrator, foundingYear, launchers, spacecraft: String?
    let parent, imageUrl: String?
    let logoUrl: String?
}

// MARK: - Mock

// swiftlint:disable line_length
extension Agency {
    static let mock = Agency(id: 27,
                             url: "https://lldev.thespacedevs.com/2.2.0/agencies/27/",
                             name: "European Space Agency",
                             featured: false,
                             type: "Multinational",
                             countryCode: "AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR",
                             abbrev: "ESA",
                             description: "The European Space Agency is an intergovernmental organisation of 22 member states. Established in 1975 and headquartered in Paris, France, ESA has a worldwide staff of about 2,000 employees.\r\n\r\nESA's space flight programme includes human spaceflight (mainly through participation in the International Space Station program); the launch and operation of unmanned exploration missions to other planets and the Moon; Earth observation, science and telecommunication; designing launch vehicles; and maintaining a major spaceport, the Guiana Space Centre at Kourou, French Guiana.",
                             administrator: "Director General: Josef Aschbacher",
                             foundingYear: "1975",
                             launchers: "",
                             spacecraft: "",
                             parent: nil,
                             imageUrl: nil,
                             logoUrl: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/european2520space2520agency_logo_20221130101442.png")
}
