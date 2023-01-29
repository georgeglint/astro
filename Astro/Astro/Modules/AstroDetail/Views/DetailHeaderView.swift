//
//  DetailHeaderView.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SDWebImageSwiftUI
import SwiftUI

struct DetailHeaderView: View {
    // MARK: - Properties
    
    @EnvironmentObject var theme: Theme
    let photoURL: String
    let name: String
    let agency: String
    
    // MARK: - UI Elements
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: photoURL))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(width: Constants.imageDimensions, height: Constants.imageDimensions, alignment: .center)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: theme.spacing.extraSmall))
                .shadow(radius: theme.spacing.small)
                .backgroundStyle(.white)
            
            VStack(spacing: theme.spacing.mediumSmall) {
                VStack(spacing: theme.spacing.extraSmall) {
                    Text(name)
                        .bold()
                        .font(.title)
                    Text(agency)
                        .font(.body)
                        .foregroundColor(.secondary)
                }.padding()
            }
        }
    }
}

// MARK: - PreviewProvider

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView(photoURL: Astronaut.mock.profileImage ?? "",
                         name: Astronaut.mock.name ?? "",
                         agency: Astronaut.mock.agency?.name ?? "")
        .environmentObject(Theme())
    }
}

// MARK: - Constants

extension DetailHeaderView {
    private struct Constants {
        static let imageDimensions: CGFloat = 180
    }
}
