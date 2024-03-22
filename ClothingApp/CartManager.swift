//
//  CartManager.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-22.
//

import Foundation

class CartManager: ObservableObject{
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addCard(product: Product){
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product){
        products = products.filter{$0.id != product.id}
        total -= product.price
    }
}
