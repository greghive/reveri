
import Foundation
import Combine

final class Store: ObservableObject {
    @Published var products = [Products.Product]()
    @Published var cart = [Products.Product]()
    
    private let productsSubject = PassthroughSubject<Void, Never>()
   
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
}
