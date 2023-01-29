//
//  AstroFilterRow.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

struct AstroFilterRow: View {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    let filter: AstronautType
    let isSelected: Bool
    
    // MARK: - UI Elements
    
    var body: some View {
        HStack(spacing: theme.spacing.medium) {
            Text(filter.name?.rawValue ?? "")
                .foregroundColor(.black)
                .padding(.vertical, theme.spacing.small)
            Spacer()
            if isSelected {
                Image(asset: Asset.Images.radioChecked)
                    .padding(theme.spacing.small)
            }
        }
    }
}

// MARK: - PreviewProvider

struct AstroFilterRow_Previews: PreviewProvider {
    static var previews: some View {
        AstroFilterRow(filter: AstronautType.mock, isSelected: true)
            .environmentObject(Theme())
    }
}
