//
//  CartManager.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addCard(product: Product) {
        products.append(product)
        total += product.price
    }
    func removeFromCart(product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            total -= product.price
        }
    }
}

