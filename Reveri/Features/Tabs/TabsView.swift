
import SwiftUI

struct TabsView: View {
    @State var selection: Tab = .products
    
    enum Tab {
        case products
        case cart
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ProductsView()
                .tabItem { Label("Products", systemImage: "list.bullet.circle.fill") }
                .tag(Tab.products)
            CartView()
                .tabItem { Label("Cart", systemImage: "cart.circle.fill") }
                .tag(Tab.cart)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
