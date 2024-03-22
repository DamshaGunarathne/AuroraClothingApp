//
//  Product.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-19.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "ASHLEY", image: "Frock1", price: 3600),
                   Product(name: "CLEARA LONG SLEEVE", image: "Top1", price: 1700),
                   Product(name: "SEPHORA", image: "Trouserf2", price: 4850),
                   Product(name: "ELENORA", image: "Frock3", price: 4600),
                   Product(name: "CLARA DARK BLUE", image: "TrouseF1", price: 5460),
                   Product(name: "EMMA PINK LAYERD SKIRT", image: "Skirt2", price: 3900),
                   Product(name: "SELENA STRAPY", image: "Frock2", price: 2800),
                   Product(name: "SANDRA LONG SLEEVE", image: "Top2", price: 1500),
                   Product(name: "TIFFINI TWO COLOUR", image: "Frock4", price: 6600),
                   Product(name: "MARLY PLATED", image: "Skirt1", price: 2670),
                   Product(name: "SWETY", image: "top3", price: 1900),
                   Product(name: "POLO TIPPING", image: "Tshirt1", price: 4600),
                   Product(name: "JACQUARD POLO", image: "Tshirt3", price: 3600),
                   Product(name: "ESTHARA GREEN", image: "Trouserf3", price: 3600),
                   Product(name: "BASIC OVER SIZED", image: "Frock1", price: 3500),
                   Product(name: "LOUNGWEAR", image: "TrouserM1", price: 6600),
                   Product(name: "MID BLUE", image: "TrouserM2", price: 7500),
                   Product(name: "BLACK SLIM FIT", image: "TrouserM3", price: 8700)
                   
]
