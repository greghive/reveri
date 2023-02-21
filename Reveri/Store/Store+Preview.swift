
extension Store  {
    static var preview: Store {
        let store = Store()
        store.products = Products.stub.products
        store.cart = Products.stub.products
        return store
    }
}

extension Product {
    static var outOfStock: Product {
        var product = Products.stub.products[0]
        product.stock = 0
        return product
    }
}
