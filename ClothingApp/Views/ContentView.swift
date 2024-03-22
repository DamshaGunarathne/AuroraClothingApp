import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @StateObject var viewModel = SideBarViewModel()
   
    
    @State private var sidebarIsPresented = false
    
    var columns = [GridItem( .adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(productList, id: \.id) { product in
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                .navigationTitle("AuroraAttire")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            sidebarIsPresented.toggle()
                        }) {
                            Image(systemName: "line.horizontal.3")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CartView().environmentObject(cartManager)) {
                            CartButton(numberOfProducts: cartManager.products.count)
                        }
                    }
                }
                
                if sidebarIsPresented {
                    SideBar(viewModel: viewModel)
                        .frame(width: 200)
                        .background(Color.white)
                        .transition(.move(edge: .leading))
                }
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

