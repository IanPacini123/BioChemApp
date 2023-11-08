//
//  BioChemAppApp.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

@main
struct BioChemAppApp: App {
    @State var navigationPath: NavigationPath = NavigationPath()
    var body: some Scene {
        WindowGroup {
            ContentView(navigationPath: $navigationPath)
                .preferredColorScheme(.light)
        }
    }
}
