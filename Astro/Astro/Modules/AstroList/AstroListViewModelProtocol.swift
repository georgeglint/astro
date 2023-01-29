//
//  AstroListViewModelProtocol.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

protocol AstroListViewModelProtocol: ObservableObject {
    var astroRepository: AstroRepositoryProtocol { get }
    var astronauts: [Astronaut] { get set }
    var hasMoreResults: Bool { get }
    
    func fetchAstronauts() async
    func fetchNextAstronauts() async
}
