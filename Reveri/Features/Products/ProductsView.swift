
import SwiftUI

struct ProductsView: View {
    @State private var appeared = false
    @State private var selectedProduct: Products.Product?
    @ObservedObject var store: Store
        
    var body: some View {
        NavigationStack {
            ProductsGrid(products: store.products, numColumns: 2) {
                selectedProduct = $0
            }
            .refreshable {
                store.getProducts()
            }
            .navigationTitle("Products")
            .onAppear {
                if !appeared {
                    appeared = true
                    store.getProducts()
                }
            }
            .sheet(item: $selectedProduct) {
                ProductView(product: $0)
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(store: .preview)
    }
}
