
import SwiftUI

struct ProductsView: View {
    @State private var appeared = false
    @ObservedObject var store: Store
        
    var body: some View {
        NavigationStack {
            ProductsGrid(products: store.products, numColumns: 2) {
                print($0)
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
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(store: .preview)
    }
}
