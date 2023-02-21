
extension Store  {
    static var preview: Store {
        let store = Store()
        store.products = Products.stub.products
        store.cart = Products.stub.products
        return store
    }
}
