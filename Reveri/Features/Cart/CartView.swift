
import SwiftUI

struct CartView: View {
    @ObservedObject var store: Store
    
    var body: some View {
        NavigationStack {
            content
            .navigationTitle("Cart")
        }
    }
    
    @ViewBuilder private var content: some View {
        if store.cart.count > 0 {
            List {
                ForEach(store.cart) {
                    CartCell(product: $0)
                }
                .onDelete { 
                    store.cart.remove(atOffsets: $0)
                }
            }
        } else {
            Text("Your cart is empty")
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(store: .preview)
    }
}
