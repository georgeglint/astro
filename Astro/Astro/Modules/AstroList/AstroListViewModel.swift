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
    
    // MARK: - Properties
    
    private(set) var nextPath: String?
    
    // MARK: - Lifecycle
    
    init(astroRepository: AstroRepositoryProtocol = AstroRepository()) {
        self.astroRepository = astroRepository
    }
}

// MARK: - AstroListViewModelProtocol

extension AstroListViewModel: AstroListViewModelProtocol {
    @MainActor
    func fetchAstronauts() async {
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
}
