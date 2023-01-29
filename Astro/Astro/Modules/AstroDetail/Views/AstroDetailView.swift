//
//  AstroDetailView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

struct AstroDetailView: View {
    // MARK: - Properties
    
    @ObservedObject var viewModel: AstroDetailViewModel
    
    // MARK: - UI Elements
    
    var body: some View {
        ScrollView {
            VStack {
                DetailHeaderView(photoURL: viewModel.photoURL,
                                 name: viewModel.name,
                                 agency: viewModel.agency)
                DetailBioView(links: viewModel.links,
                              dateOfBirth: viewModel.dateOfBirth,
                              biography: viewModel.biography)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PreviewProvider

struct AstroDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AstroDetailView(viewModel: AstroDetailViewModel(astronaut: Astronaut.mock))
    }
}
