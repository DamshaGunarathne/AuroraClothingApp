import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartManager: CartManager
    let product: Product
    @State private var selectedSizeIndex = 0 // Default to first size
    @State private var rating: Int = 0 // Add rating state

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()

                Text(product.name)
                    .font(.title)
                    .padding(.horizontal)

                Text("Price: Rs \(product.price)")
                    .padding(.horizontal)

                // Size buttons
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Size")
                        .font(.headline)
                        .foregroundColor(.primary)

                    // Buttons for each size
                    HStack(spacing: 8) {
                        ForEach(0..<product.sizes.count, id: \.self) { index in
                            Button(action: {
                                selectedSizeIndex = index
                                // Save the selected size to UserDefaults or perform any other necessary action
                                saveSelectedSize()
                            }) {
                                Text(product.sizes[index])
                                    .font(.subheadline)
                                    .padding()
                                    .background(selectedSizeIndex == index ? Color.blue.opacity(0.5) : Color.clear)
                                    .foregroundColor(selectedSizeIndex == index ? .white : .blue)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(selectedSizeIndex == index ? Color.blue : Color.clear, lineWidth: 1)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal)

                HStack {
                                   Text("Colors:")
                                       .padding(.horizontal)

                                   ForEach(product.colors, id: \.self) { color in
                                       let colorString = color.toHexString()
                                       Circle()
                                           .fill(Color(hex: colorString))
                                           .frame(width: 20, height: 20)
                                           .overlay(Circle().stroke(Color.black, lineWidth: 1))
                                           .padding(.horizontal, 4)
                                   }
                               }

                Text("Availability: \(product.isAvailable ? "In Stock" : "Out of Stock")")
                    .padding(.horizontal)

                // Rating stars
                VStack(alignment: .leading, spacing: 8) {
                    Text("Rating")
                        .font(.headline)
                        .foregroundColor(.primary)

                    RatingView(rating: $rating)
                }

            }

            // Button to add the product to the cart
            Button(action: {
                cartManager.addCard(product: product)
            }) {
                HStack {
                    Image(systemName: "cart.badge.plus")
                    Text("Add to Cart")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .onAppear {
            // Load the selected size when the view appears
            loadSelectedSize()
        }
    }
    
    func saveSelectedSize() {
        UserDefaults.standard.set(selectedSizeIndex, forKey: "product_\(product.id)_selectedSizeIndex")
    }
    
    func loadSelectedSize() {
        selectedSizeIndex = UserDefaults.standard.integer(forKey: "product_\(product.id)_selectedSizeIndex")
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[0])
            .environmentObject(CartManager())
    }
}
