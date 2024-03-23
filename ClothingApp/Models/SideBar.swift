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
            List(viewModel.menuItems, id: \.name) { menuItem in
                Button(action: {
                    selectedCategory = menuItem
                    selectedItem = menuItem
                }) {
                    Label(menuItem.name, systemImage: menuItem.iconName)
                        .foregroundColor(selectedItem == menuItem ? .blue : .black)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 8)
            }
            Button(action: {
                isLoginViewPresented.toggle()
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.vertical, 8)
            .sheet(isPresented: $isLoginViewPresented) {
                LoginView()
            }
        }
        .listStyle(SidebarListStyle())
        .frame(width: 200)
    }
}


