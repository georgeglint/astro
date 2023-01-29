//
//  AstroListViewModel.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import Foundation

final class AstroListViewModel: ObservableObject {
    // MARK: - AstroListViewModelProtocol
    
    var astroRepository: AstroRepositoryProtocol
    @Published var astronauts: [Astronaut] = []
    var hasMoreResults: Bool { nextPath != nil }
    var filters: [AstronautType] = []
    var selectedFilter: AstronautType?
    
    // MARK: - Properties
    
    private(set) var nextPath: String?
    private(set) var liveFilter: AstronautType?
    
    // MARK: - Computed Properties
    
    var defaultFilters: [AstronautType] {
        AstronautTypeDescription.allCases.map {
            AstronautType(id: $0.id, name: $0)
        }
    }
    
    // MARK: - Lifecycle
    
    init(astroRepository: AstroRepositoryProtocol = AstroRepository()) {
        self.astroRepository = astroRepository
    }
    
    // MARK: - Private Methods
    
    private func resetFilters() {
        selectedFilter = nil
        liveFilter = nil
        filters = defaultFilters
    }
}

// MARK: - AstroListViewModelProtocol

extension AstroListViewModel: AstroListViewModelProtocol {
    @MainActor
    func fetchAstronauts() async {
        resetFilters()
        nextPath = nil
        
        do {
            let response = try await astroRepository.fetchAstronauts(with: nil, filter: nil)
            nextPath = response.next
            astronauts = response.results ?? []
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func fetchNextAstronauts() async {
        do {
            let response = try await astroRepository.fetchAstronauts(with: nextPath, filter: nil)
            nextPath = response.next
            astronauts.append(contentsOf: response.results ?? [])
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func filterAstronautsIfNeeded() async {
        guard let selectedFilter, (selectedFilter != liveFilter) else { return }
        nextPath = nil
        
        do {
            let response = try await astroRepository.fetchAstronauts(with: nil, filter: selectedFilter.id)
            liveFilter = selectedFilter
            nextPath = response.next
            astronauts = response.results ?? []
        } catch {
            print(error)
        }
    }
    
    func isFilterSelected(_ filter: AstronautType) -> Bool {
        filter == selectedFilter
    }
    
    @MainActor
    func setSelectedFilter(_ filter: AstronautType?) {
        selectedFilter = filter
    }
    
    @MainActor
    func resetToLiveFilter() {
        selectedFilter = liveFilter
    }
}
