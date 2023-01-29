//
//  AstroListView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

struct AstroListView<Model>: View where Model: AstroListViewModelProtocol {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    @ObservedObject var viewModel: Model
    
    // MARK: - UI Elements
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewModel.astronauts, id: \.id) { astronaut in
                            AstroListRow(astronaut: astronaut)
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: theme.spacing.extraSmall)
                                .foregroundColor(.white)
                                .padding(.vertical, theme.spacing.extraSmall)
                        )
                    }
                }
                
                if viewModel.hasMoreResults {
                    Section {
                        ProgressView()
                            .onAppear(perform: {
                                Task {
                                    await viewModel.fetchNextAstronauts()
                                }
                            })
                    }
                    .listRowBackground(
                        EmptyView()
                            .foregroundColor(.clear)
                    )
                }
            }
            .navigationTitle(L10n.dAstronauts)
        }.onAppear(perform: {
            Task {
                await viewModel.fetchAstronauts()
            }
        })
    }
}

// MARK: - PreviewProvider

struct AstroListView_Previews: PreviewProvider {
    static var previews: some View {
        AstroListView(viewModel: MockAstroListViewModel())
            .environmentObject(Theme())
    }
}
