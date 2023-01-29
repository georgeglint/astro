//
//  MockAstroListViewModel.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

class MockAstroListViewModel {
    var astroRepository: AstroRepositoryProtocol = MockAstroRepository()
    var astronauts: [Astronaut] = {
        let response = try? TestData.modelFromJSON(with: .astronauts) as AstroListResponse
        return response?.results ?? []
    }()
    var filters: [AstronautType] = []
    var selectedFilter: AstronautType?
    var hasMoreResults = false
}

// MARK: - AstroListViewModelProtocol

extension MockAstroListViewModel: AstroListViewModelProtocol {
    func fetchAstronauts() async {}
    func fetchNextAstronauts() async {}
    func filterAstronautsIfNeeded() async {}
    func isFilterSelected(_ filter: AstronautType) -> Bool { true }
    func setSelectedFilter(_ filter: AstronautType?) {}
    func resetToLiveFilter() {}
}
