//
//  Astronaut.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

// MARK: - Astronaut

struct Astronaut: Decodable, Equatable {
    let id: Int?
    let url: String?
    let name: String?
    let status: AstronautStatus?
    let type: AstronautType?
    let age: Int?
    let dateOfBirth: String?
    let dateOfDeath: String?
    let nationality, bio: String?
    var twitter, instagram, wiki: String?
    let agency: Agency?
    let profileImage, profileImageThumbnail: String?
    let flightsCount, landingsCount: Int?
    let lastFlight, firstFlight: String?
}

// MARK: - Mock

// swiftlint:disable line_length
extension Astronaut {
    static let mock = Astronaut(id: 1,
                                url: "https://lldev.thespacedevs.com/2.2.0/astronaut/1/",
                                name: "Thomas Pesquet",
                                status: AstronautStatus.mock,
                                type: AstronautType.mock,
                                age: 44,
                                dateOfBirth: "1978-02-27",
                                dateOfDeath: nil,
                                nationality: "French",
                                bio: "Thomas Gautier Pesquet is a French aerospace engineer, pilot, and European Space Agency astronaut. Pesquet was selected by ESA as a candidate in May 2009, and he successfully completed his basic training in November 2010. From November 2016 to June 2017, Pesquet was part of Expeditions 50 and 51 on the International Space Station as a flight engineer.",
                                twitter: "https://twitter.com/Thom_astro",
                                instagram: "https://instagram.com/thom_astro",
                                wiki: "https://en.wikipedia.org/wiki/Thomas_Pesquet",
                                agency: Agency.mock,
                                profileImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/thomas2520pesquet_image_20200102120546.jpeg",
                                profileImageThumbnail: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/thomas_pesquet_thumbnail_20220911033657.jpeg",
                                flightsCount: 2,
                                landingsCount: 2,
                                lastFlight: "2021-04-23T09:49:02Z",
                                firstFlight: "2016-11-17T20:20:13Z")
}
