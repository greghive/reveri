
import SwiftUI

struct TabsView: View {
    @State var selection: Tab = .products
    @ObservedObject var store: Store
    
    enum Tab {
        case products
        case cart
    }
    
    var body: some View {
        TabView(selection: $selection) {
            
            ProductsView(store: store)
                .tabItem { Label("Products", systemImage: "list.bullet.circle.fill") }
                .tag(Tab.products)
            
            CartView(store: store)
                .tabItem { Label("Cart", systemImage: "cart.circle.fill") }
                .tag(Tab.cart)
                .badge(store.cart.count)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(store: .preview)
    }
}
