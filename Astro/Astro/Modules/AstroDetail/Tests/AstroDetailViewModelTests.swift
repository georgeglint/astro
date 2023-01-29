//
//  AstroDetailViewModelTests.swift
//  AstroTests
//
//  Created by George Leadbeater on 29/01/2023.
//

@testable import Astro
import XCTest

class AstroDetailViewModelTests: XCTestCase {
    // MARK: - Properties
    
    var viewModel: AstroDetailViewModel!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        viewModel = AstroDetailViewModel(astronaut: Constants.mockAstronaut)
    }
    
    // MARK: - Test Methods
    
    func testWhenInit_ThenSetPhotoURL() throws {
        let photoURL = try XCTUnwrap(Constants.mockAstronaut.profileImage)
        
        XCTAssertEqual(viewModel.photoURL, photoURL)
    }
    
    func testWhenInit_ThenSetName() throws {
        let name = try XCTUnwrap(Constants.mockAstronaut.name)
        
        XCTAssertEqual(viewModel.name, name)
    }
    
    func testWhenInit_ThenSetAgency() throws {
        let agency = try XCTUnwrap(Constants.mockAstronaut.agency?.name)
        
        XCTAssertEqual(viewModel.agency, agency)
    }
    
    func testWhenInit_ThenSetDateOfBirth() throws {
        let dateOfBirth = try XCTUnwrap(Constants.mockAstronaut.dateOfBirth)
        
        XCTAssertEqual(viewModel.dateOfBirth, dateOfBirth)
    }
    
    func testWhenInit_ThenGenerateAndSetLinks() {
        let links = [
            AstronautLink(name: L10n.nInstagram, url: Constants.mockAstronaut.instagram),
            AstronautLink(name: L10n.nTwitter, url: Constants.mockAstronaut.twitter),
            AstronautLink(name: L10n.nWikipedia, url: Astronaut.mock.wiki)
        ]
        
        XCTAssertEqual(viewModel.links, links)
    }
    
    func testWhenInit_ThenFiltersLinksIfNeeded() {
        var astronaut = Astronaut.mock
        astronaut.wiki = nil
        viewModel = AstroDetailViewModel(astronaut: astronaut)
        
        let links = [
            AstronautLink(name: L10n.nInstagram, url: Constants.mockAstronaut.instagram),
            AstronautLink(name: L10n.nTwitter, url: Astronaut.mock.twitter)
        ]
        
        XCTAssertEqual(viewModel.links, links)
    }
}

// MARK: - Constants

private struct Constants {
    static let mockAstronaut: Astronaut = .mock
}
