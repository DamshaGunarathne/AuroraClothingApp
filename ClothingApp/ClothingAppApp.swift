//
//  ClothingAppApp.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-19.
//

import SwiftUI

@main
struct ClothingAppApp: App {
    // Create a single instance of CartManager
    let cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            // Inject CartManager into the view hierarchy
            ContentView()
                .environmentObject(cartManager)
        }
    }
}

// Your other views remain the same...
