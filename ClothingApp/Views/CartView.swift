//
//  CartView.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-19.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) { product in
                    ProductRow(product: product)
                }
                
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("Rs \(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            } else {
                Text("Your cart is empty")
            }
        }
        .navigationTitle("My Cart")
        .padding(.top)
        .onAppear {
            // Refresh the view when products are added or removed from the cart
            cartManager.objectWillChange.send()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
