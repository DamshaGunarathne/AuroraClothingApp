//
//  ProductCard.swift
//  ClothingApp
//
//  Created by NIBM-LAB04-PC04 on 2024-03-19.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var isShowingDetails = false
    var product: Product
    
    var body: some View{
        NavigationLink(destination: ProductDetailsView(product: product), isActive: $isShowingDetails) {
            ZStack(alignment: .topTrailing){
                ZStack(alignment: .bottom){
                    Image(product.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                    
                    VStack(alignment: .leading){
                        Text(product.name)
                            .bold()
                        
                        Text("Rs\(product.price)")
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
                
                Button {
                    cartManager.addCard(product: product)
                } label: {
                    Image(systemName: "plus")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                .padding(10)
                
            }
            .onTapGesture {
                isShowingDetails = true
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])
            .environmentObject(CartManager())
    }
}
