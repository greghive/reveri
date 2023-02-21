
import XCTest
@testable import Reveri

final class StoreTests: XCTestCase {
    private var sut: Store!
    private let stubProducts = Products.stub.products
    
    override func setUp() {
        sut = Store()
        sut.products = stubProducts
    }
    
    func test_cartTotal_withoutCartProducts() {
        sut.cart = []
        XCTAssertEqual("", sut.cartTotal)
    }
    
    func test_cartTotal_withCartProducts() {
        let productA = stubProducts[0]
        let productB = stubProducts[1]
        sut.cart = [productA, productB]
        XCTAssertEqual("£\(productA.price + productB.price)", sut.cartTotal)
    }
    
    func test_addToCart_forOutOfStockProduct() {
        let product = stubProducts[0]
        sut.products[0].stock = 0
        sut.addToCart(product)
        XCTAssertEqual(sut.cart, [])
    }
    
    func test_addToCart_decrementsStock() {
        XCTAssertEqual(sut.products[0].stock, 94)
        let product = stubProducts[0]
        sut.addToCart(product)
        XCTAssertEqual(sut.products[0].stock, 93)
    }
    
    func test_addToCart_addsToCart() {
        let product = stubProducts[0]
        sut.addToCart(product)
        XCTAssertEqual(sut.cart.count, 1)
        XCTAssertEqual(sut.cart[0].id, product.id)
    }
    
    func test_removeFromCart_incrementsStock() {
        let product = stubProducts[0]
        sut.addToCart(product)
        XCTAssertEqual(sut.products[0].stock, 93)
        sut.removeFromCart(product, offsets: IndexSet([0]))
        XCTAssertEqual(sut.products[0].stock, 94)
    }
    
    func test_removeFromCart_removesFromCart() {
        let product = stubProducts[0]
        sut.cart = [product]
        sut.removeFromCart(product, offsets: IndexSet([0]))
        XCTAssertEqual(sut.cart, [])
    }
}
