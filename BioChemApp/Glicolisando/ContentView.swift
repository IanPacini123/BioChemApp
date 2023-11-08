//
//  ContentView.swift
//  BioChemApp
//
//  Created by Ian Pacini on 06/11/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var navigationPath: NavigationPath
    var body: some View {
        NavigationStack(path: $navigationPath) {
            MainView(navigationPath: $navigationPath)
        }
    }
}

#Preview {
    ContentView(navigationPath: .constant(.init()))
}
