//
//  DetailBioView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

struct DetailBioView: View {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    let links: [AstronautLink]
    let dateOfBirth: String
    let biography: String
    
    // MARK: - UI Elements
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(links, id: \.name) { link in
                HStack(spacing: theme.spacing.extraSmall) {
                    Text("\(link.name):")
                        .bold()
                        .font(.body)
                    Link(L10n.aView, destination: URL(string: link.url ?? "")!)
                        .bold()
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, theme.spacing.extraSmall)
                .padding(.horizontal, theme.spacing.medium)
            }
            
            HStack(spacing: theme.spacing.extraSmall) {
                Text(L10n.dDateOfBirth)
                    .bold()
                    .font(.body)
                Text(dateOfBirth)
                    .font(.subheadline)
            }
            .padding(.vertical, theme.spacing.extraSmall)
            .padding(.horizontal, theme.spacing.medium)
            
            VStack(alignment: .leading, spacing: theme.spacing.extraSmall) {
                Text(L10n.dBio)
                    .bold()
                    .font(.body)
                Text(biography)
                    .multilineTextAlignment(.leading)
            }.padding(theme.spacing.medium)
        }
    }
}

// MARK: - PreviewProvider

struct DetailBioView_Previews: PreviewProvider {
    static var previews: some View {
        DetailBioView(links: [.mock],
                      dateOfBirth: Astronaut.mock.dateOfBirth ?? "",
                      biography: Astronaut.mock.bio ?? "")
        .environmentObject(Theme())
    }
}
