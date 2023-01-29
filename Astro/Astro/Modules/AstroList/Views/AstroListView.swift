//
//  AstroListView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

// MARK: - FilterSheetAction

enum FilterSheetAction {
    case apply
    case clear
    case cancel
}

// MARK: - AstroListView

struct AstroListView<Model>: View where Model: AstroListViewModelProtocol {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    @ObservedObject var viewModel: Model
    @State var isDisplayingFilters = false
    @State var filterSheetAction: FilterSheetAction = .cancel
    @State var selectedFilter: AstronautType?
    
    // MARK: - UI Elements
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(viewModel.astronauts, id: \.id) { astronaut in
                        NavigationLink(destination: AstroDetailView(viewModel: AstroDetailViewModel(astronaut: astronaut))) {
                            AstroListRow(astronaut: astronaut)
                        }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.aFilter) {
                        isDisplayingFilters = true
                    }
                }
            }
            .sheet(isPresented: $isDisplayingFilters, onDismiss: {
                switch filterSheetAction {
                case .apply:
                    Task {
                        await viewModel.filterAstronautsIfNeeded()
                    }
                case .clear:
                    Task {
                        await viewModel.fetchAstronauts()
                    }
                case .cancel:
                    viewModel.resetToLiveFilter()
                }
            }, content: {
                AstroFilterView(viewModel: viewModel,
                                selectedFilter: $selectedFilter,
                                isPresented: $isDisplayingFilters,
                                action: $filterSheetAction)
            })
            .onChange(of: selectedFilter) { selectedFilter in
                viewModel.setSelectedFilter(selectedFilter)
            }
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
