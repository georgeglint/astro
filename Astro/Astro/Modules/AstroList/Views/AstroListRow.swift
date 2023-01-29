//
//  AstroListRow.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SDWebImageSwiftUI
import SwiftUI

struct AstroListRow: View {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    let astronaut: Astronaut
    
    // MARK: - UI Elements
    
    var body: some View {
        HStack(spacing: theme.spacing.medium) {
            WebImage(url: URL(string: astronaut.profileImageThumbnail ?? ""))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(width: Constants.imageDimensions, height: Constants.imageDimensions)
                .cornerRadius(theme.spacing.extraSmall)
                .padding(.vertical, theme.spacing.extraSmall)

            VStack(alignment: .leading, spacing: theme.spacing.extraSmall) {
                Text(astronaut.name ?? "")
                    .foregroundColor(Color.black)
                Text(astronaut.agency?.name ?? "")
                    .foregroundColor(Color.gray)
                    .font(.caption)
            }
        }
    }
}

// MARK: - PreviewProvider

struct AstroListRow_Previews: PreviewProvider {
    static var previews: some View {
        AstroListRow(astronaut: Astronaut.mock)
            .environmentObject(Theme())
    }
}

// MARK: - Constants

extension AstroListRow {
    private struct Constants {
        static let imageDimensions: CGFloat = 60
    }
}
