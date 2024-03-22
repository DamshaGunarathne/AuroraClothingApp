//
//  SideBarViewModel.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//

import Foundation

class SideBarViewModel: ObservableObject {
    // Data for sidebar menu
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "Women's Wear", iconName: "person.crop.circle"),
        MenuItem(name: "Men's Wear", iconName: "person.crop.circle"),
        MenuItem(name: "Kids Wear", iconName: "person.crop.circle")
    ]
}

struct MenuItem {
    let name: String
    let iconName: String
}
