//
//  SideBar.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//
import SwiftUI

struct SideBar: View {
    @ObservedObject var viewModel: SideBarViewModel
    @Binding var selectedCategory: MenuItem?
    @State private var selectedItem: MenuItem? = nil
    @State private var isLoginViewPresented = false

    var body: some View {
        VStack {
            List(viewModel.menuItems, id: \.self) { menuItem in
                Button(action: {
                    selectedCategory = menuItem
                    selectedItem = menuItem
                }) {
                    HStack {
                        Image(systemName: menuItem.iconName)
                            .foregroundColor(selectedItem == menuItem ? .black : .gray)
                            .frame(width: 24, height: 24) // Adjust icon size as needed
                        Text(menuItem.name)
                            .foregroundColor(selectedItem == menuItem ? .black : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 8)
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing:
                Button(action: {
                    isLoginViewPresented.toggle()
                }) {
                    Text("Login")
                }
            )
            


            .padding(.bottom, 20) // Add padding to create space at the bottom
        }
        .listStyle(SidebarListStyle())
        .frame(width: 300)
    }
}
