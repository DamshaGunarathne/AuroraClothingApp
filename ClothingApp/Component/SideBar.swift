//
//  SideBar.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//
import SwiftUI

struct SideBar: View {
    @ObservedObject var viewModel: SideBarViewModel
    
    var body: some View {
        List(viewModel.menuItems, id: \.name) { menuItem in
            NavigationLink(destination: Text(menuItem.name)) {
                Label(menuItem.name, systemImage: menuItem.iconName)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(width: 200)
    }
}


