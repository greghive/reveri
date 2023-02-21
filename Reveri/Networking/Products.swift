
import Foundation
import Combine

enum Products {

    static let api = API(session: .shared)
    
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        return decoder
    }()
    
    struct Response: Codable {
        let products: [Product]
        let total: Int
        let skip: Int
        let limit: Int
    }
}

struct Product: Codable, Equatable, Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    var stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}

extension Product {
    var inStock: Bool {
        stock > 0
    }
}

extension Request {
    static func products(skip: Int = 0, limit: Int = 30) -> Request {
        Request(
            method: .get,
            path: "/products",
            queries: ["skip": "\(skip)", "limit": "\(limit)"]
        )
    }
}

fileprivate extension Request {
    init(method: RequestMethod, path: String, queries: [String: String]) {
        self.scheme = "https"
        self.host = "dummyjson.com"
        self.headers = nil
        self.method = method
        self.path = path
        self.queries = queries
        self.body = nil
    }
}

extension API {
    func call<T: Decodable>(_ request: Request) -> AnyPublisher<T, Error> {
        send(request: request, decoder: Products.decoder)
    }
}

func productsPublisher() -> AnyPublisher<[Product], Error> {
    Products.api.call(.products())
        .map(\Products.Response.products)
        .eraseToAnyPublisher()
}
