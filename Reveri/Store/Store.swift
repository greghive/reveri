
import Foundation
import Combine

final class Store: ObservableObject {
    @Published var products = [Product]()
    @Published var cart = [Product]()
    
    private let productsSubject = PassthroughSubject<Void, Never>()
    
    var cartTotal: String {
        let total = cart.reduce(0) { $0 + $1.price }
        return total > 0 ? "£\(total)" : ""
    }
    
    init() {
       productsSubject
            .map(productsPublisher)
            .switchToLatest()
            .replaceError(with: [])
            .assign(to: &$products)
    }
    
    func getProducts() {
        productsSubject.send()
    }
        
    func addToCart(_ p: Product) {
        if let index = productIndex(for: p) {
            var product = products[index]
            if product.stock > 0 {
                product.stock -= 1
                products[index] = product
                cart.append(product)
            }
        }
    }
    
    func removeFromCart(_ p: Product, offsets: IndexSet) {
        if let index = productIndex(for: p) {
            var product = products[index]
            product.stock += 1
            products[index] = product
            cart.remove(atOffsets: offsets)
        }
    }
    
    private func productIndex(for product: Product) -> Int? {
        products.firstIndex(where: { $0.id == product.id })
    }
}
