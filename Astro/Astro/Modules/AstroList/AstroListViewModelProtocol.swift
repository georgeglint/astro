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
    var filters: [AstronautType] { get }
    var selectedFilter: AstronautType? { get }
    var hasMoreResults: Bool { get }
    
    func fetchAstronauts() async
    func fetchNextAstronauts() async
    func filterAstronautsIfNeeded() async
    func isFilterSelected(_ filter: AstronautType) -> Bool
    func setSelectedFilter(_ filter: AstronautType?)
    func resetToLiveFilter()
}
