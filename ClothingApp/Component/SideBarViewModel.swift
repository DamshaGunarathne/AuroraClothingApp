//
//  SideBarViewModel.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//

import Foundation

// Make MenuItem conform to Equatable
struct MenuItem: Equatable, Hashable {
    let name: String
    let iconName: String
    let typeId: Int
    
    // Implement Equatable protocol by defining == function
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        return lhs.name == rhs.name && lhs.iconName == rhs.iconName && lhs.typeId == rhs.typeId
    }
}

class SideBarViewModel: ObservableObject {
    // Data for sidebar menu
    @Published var menuItems: [MenuItem] = [
        MenuItem(name: "Women's Wear", iconName: "wand.and.rays", typeId: 1),
        MenuItem(name: "Men's Wear", iconName: "briefcase", typeId: 2),
        MenuItem(name: "Kids Wear", iconName: "star.circle", typeId: 3)
    ]
}
