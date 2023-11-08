//
//  GlicosandoApp.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

@main
struct GlicosandoApp: App {
    @State var navigationPath: NavigationPath = NavigationPath()
    var body: some Scene {
        WindowGroup {
            ContentView(navigationPath: $navigationPath)
                .preferredColorScheme(.light)
        }
    }
}
