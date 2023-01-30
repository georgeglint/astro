//
//  AstroFilterView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

struct AstroFilterView<Model>: View where Model: AstroListViewModelProtocol {
    // MARK: - Properties
    
    @ObservedObject var viewModel: Model
    @Binding var selectedFilter: AstronautType?
    @Binding var isPresented: Bool
    @Binding var action: FilterSheetAction
    
    // MARK: - UI Elements
    
    var body: some View {
        NavigationView {
            List {
                Section(L10n.dType) {
                    ForEach(viewModel.filters, id: \.id) { filter in
                        let isSelected = viewModel.isFilterSelected(filter)
                        AstroFilterRow(filter: filter, isSelected: isSelected)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedFilter = filter
                            }
                    }
                }
                .listStyle(.insetGrouped)
                .listRowBackground(
                    Rectangle()
                        .foregroundColor(.white)
                )
            }
            .navigationTitle(L10n.dFilter)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if viewModel.selectedFilter != nil {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(L10n.aClear, action: {
                            action = .clear
                            selectedFilter = nil
                        })
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.aApply, action: {
                        action = (selectedFilter == nil ? .clear : .apply)
                        isPresented = false
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        action = .cancel
                        isPresented = false
                    } label: {
                        Image(asset: Asset.close)
                    }
                }
            }
        }
    }
}

// MARK: - PreviewProvider

struct AstroFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AstroFilterView(viewModel: MockAstroListViewModel(),
                        selectedFilter: .constant(.mock),
                        isPresented: .constant(true),
                        action: .constant(.cancel))
    }
}
