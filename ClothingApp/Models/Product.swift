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
    var typeId: Int
}

var productList = [Product(name: "ASHLEY", image: "Frock1", price: 3600, typeId: 1 ),
                   Product(name: "CLEARA LONG SLEEVE", image: "Top1", price: 1700, typeId: 1),
                   Product(name: "LILY SHOULDER", image: "kids2", price: 1450, typeId:3),
                   Product(name: "SEPHORA", image: "Trouserf2", price: 4850, typeId:1),
                   Product(name: "CHINESE COLLAR LONG", image: "Shirt1", price: 4850, typeId:2),
                   Product(name: "ELENORA", image: "Frock3", price: 4600, typeId:1),
                   Product(name: "LILY FLARED", image: "kids1", price: 1895, typeId:3),
                   Product(name: "CLARA DARK BLUE", image: "TrouseF1", price: 5460, typeId:1),
                   Product(name: "CREW NECK T-SHIRT", image: "Tshirt4", price: 7800, typeId:2),
                   Product(name: "EMMA PINK LAYERD SKIRT", image: "Skirt2", price: 3900, typeId:1),
                   Product(name: "SELENA STRAPY", image: "Frock2", price: 2800, typeId:1),
                   Product(name: "SANDRA LONG SLEEVE", image: "Top2", price: 1500, typeId:1),
                   Product(name: "CRINKLE POLYESTER", image: "Shirt3", price: 4500, typeId:2),
                   Product(name: "TIFFINI TWO COLOUR", image: "Frock4", price: 6600, typeId:1),
                   Product(name: "MOON WASH REQULAR", image: "Tshirt5", price: 8600, typeId:2),
                   Product(name: "MARLY PLATED", image: "Skirt1", price: 2670, typeId:1),
                   Product(name: "SWETY", image: "top3", price: 1900, typeId:1),
                   Product(name: "POLO TIPPING", image: "Tshirt1", price: 4600, typeId:2),
                   Product(name: "JACQUARD POLO", image: "Tshirt3", price: 3600, typeId:2),
                   Product(name: "ESTHARA GREEN", image: "Trouserf3", price: 3600, typeId:1),
                   Product(name: "BASIC OVER SIZED", image: "Frock1", price: 3500, typeId:1),
                   Product(name: "LOUNGWEAR", image: "TrouserM1", price: 6600, typeId:2),
                   Product(name: "MID BLUE", image: "TrouserM2", price: 7500, typeId: 2),
                   Product(name: "BLACK SLIM FIT", image: "TrouserM3", price: 8700, typeId: 2),
                   Product(name: "VICTORIA GATHERED", image: "Frock6", price: 5750, typeId: 1),
                   Product(name: "LEAH SKIRT", image: "Skirt3", price: 2200, typeId: 1),
                   Product(name: "JENIZA TEE", image: "top4", price: 1170, typeId: 1),
                   Product(name: "BUTTON-UP", image: "Shirt2", price: 5900, typeId:2),
                   Product(name: "JANE PUFF", image: "top5", price: 1900, typeId: 1),
                   Product(name: "CHARLOTTE BLACK", image: "Skirt4", price: 2000, typeId: 1),
                   Product(name: "CLARA DARK BLUE", image: "Trouserf4", price: 4600, typeId: 1),
                   Product(name: "PRINTED NORMAL", image: "Shirt4", price: 4500, typeId:2),
                   Product(name: "LELA STRIPED", image: "top6", price: 1600, typeId: 1),
                   Product(name: "SUNFLOWER YELLOW", image: "Frock5", price: 3200, typeId: 1),
                   Product(name: "BOYS SHORT SLEEVE", image: "kids3", price: 1450, typeId:3),
                   Product(name: "LIYONA PANT", image: "Trouserf5", price: 3300, typeId: 1),
                   Product(name: "ALIZA SIDE SLIT", image: "Trouserf6", price: 7500, typeId: 1),
                   
                   
]
