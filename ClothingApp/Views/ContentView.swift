import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @StateObject var viewModel = SideBarViewModel()
    @State private var sidebarIsPresented = false
    @State private var selectedCategory: MenuItem? = nil
    @State private var isLoggedIn = false

    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        NavigationView {
            if isLoggedIn {
                // Main content view
                ZStack(alignment: .topLeading) {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(filteredProducts(), id: \.id) { product in
                                ProductCard(product: product)
                                    .environmentObject(cartManager)
                            }
                            
                        }
                        ForEach(filteredProducts(), id: \.id) { product in
                                       ProductDetailsView(product: product)
                                           .environmentObject(cartManager)
                                   }
                        .padding()
                    }
                    .navigationTitle("AuroraAttire")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            HStack(spacing: 10) {
                                if selectedCategory != nil {
                                    Button(action: {
                                        selectedCategory = nil
                                    }) {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.black)
                                    }
                                }

                                Button(action: {
                                    sidebarIsPresented.toggle()
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                }
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: CartView().environmentObject(cartManager)) {
                                CartButton(numberOfProducts: cartManager.products.count)
                            }
                        }
                    }

                    if sidebarIsPresented {
                        SideBar(viewModel: viewModel, selectedCategory: $selectedCategory)
                            .frame(width: 300)
                            .background(Color.white)
                            .transition(.move(edge: .leading))
                            .gesture(
                                TapGesture()
                                    .onEnded { _ in
                                        sidebarIsPresented.toggle()
                                    }
                                    .exclusively(before: DragGesture())
                            )
                    }
                }
                .onTapGesture {
                    sidebarIsPresented = false
                }
            } else {
                // Login page
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func filteredProducts() -> [Product] {
        guard let category = selectedCategory else { return productList }
        return productList.filter { $0.typeId == category.typeId }
    }
}
