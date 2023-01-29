//
//  AstroApp.swift
//  Astro
//
//  Created by George Leadbeater on 29/01/2023.
//

import SwiftUI

@main
struct AstroApp: App {
    // MARK: - Properties
    
    @StateObject var theme = Theme()
    
    // MARK: - UI Elements
    
    var body: some Scene {
        WindowGroup {
            AstroListView(viewModel: AstroListViewModel())
                .environmentObject(theme)
        }
    }
}
