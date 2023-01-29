//
//  AstroListViewModelTests.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

@testable import Astro
import XCTest

class AstroListViewModelTests: XCTestCase {
    // MARK: - Properties
    
    var viewModel: AstroListViewModel!
    var astroRepository: MockAstroRepository!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        astroRepository = MockAstroRepository()
        viewModel = AstroListViewModel(astroRepository: astroRepository)
    }
    
    // MARK: - Test Methods
    
    func testWhenFetchAstronauts_ThenCompleteActions() async throws {
        let mockResponse = try getMockResponse()
        let results = try XCTUnwrap(mockResponse.results)
        await viewModel.fetchAstronauts()
        
        XCTAssertTrue(astroRepository.fetchAstronautsCalled)
        XCTAssertEqual(viewModel.astronauts, results)
        XCTAssertEqual(viewModel.nextPath, mockResponse.next)
    }
    
    func testWhenFetchNextAstronauts_ThenCompleteActions() async throws {
        let mockResponse = try getMockResponse()
        let results = try XCTUnwrap(mockResponse.results)
        await viewModel.fetchAstronauts()
        astroRepository.fetchAstronautsCalled = false
        await viewModel.fetchNextAstronauts()
        
        XCTAssertTrue(astroRepository.fetchAstronautsCalled)
        XCTAssertEqual(viewModel.astronauts, results + results)
        XCTAssertEqual(viewModel.nextPath, mockResponse.next)
    }
    
    func testWhenFilterAstronautsNotRequired_ThenPreventFilter() async throws {
        viewModel.selectedFilter = nil
        await viewModel.filterAstronautsIfNeeded()
        
        XCTAssertFalse(astroRepository.fetchAstronautsCalled)
    }
    
    func testWhenFilterAstronauts_ThenCompleteActions() async throws {
        let mockResponse = try getMockResponse()
        let results = try XCTUnwrap(mockResponse.results)
        viewModel.selectedFilter = .mock
        await viewModel.filterAstronautsIfNeeded()
        
        XCTAssertTrue(astroRepository.fetchAstronautsCalled)
        XCTAssertEqual(viewModel.astronauts, results)
        XCTAssertEqual(viewModel.nextPath, mockResponse.next)
        XCTAssertEqual(viewModel.liveFilter, viewModel.selectedFilter)
    }
    
    func testWhenHasMoreResults_ThenReturnsCorrectValue() async throws {
        XCTAssertFalse(viewModel.hasMoreResults)
        await viewModel.fetchAstronauts()
        
        XCTAssertTrue(viewModel.hasMoreResults)
    }
    
    func testWhenFilterSelected_ThenReturnsTrue() async throws {
        let filter = AstronautType.mock
        viewModel.selectedFilter = filter
        
        XCTAssertTrue(viewModel.isFilterSelected(filter))
    }
    
    func testWhenFilterUnselected_ThenReturnsFalse() async throws {
        viewModel.selectedFilter = .init(id: 1, name: .nonHuman)
        
        XCTAssertFalse(viewModel.isFilterSelected(.mock))
    }
    
    func testWhenResetToLiveFilter_ThenSetsSelectedFilter() async throws {
        viewModel.selectedFilter = .mock
        await viewModel.resetToLiveFilter()
        
        XCTAssertNil(viewModel.selectedFilter)
    }
    
    // MARK: - Private Methods
    
    private func getMockResponse() throws -> AstroListResponse {
        try TestData.modelFromJSON(with: .astronauts)
    }
}
