
import Foundation

enum Products {
    static let scheme = "https"
    static let host = "dummyjson.com"
    static let path = "products"
    
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

    struct Product: Codable {
        let id: Int
        let title: Int
        let description: String
        let price: Int
        let discountPercentage: Double
        let rating: Double
        let stock: Int
        let brand: String
        let category: String
        let thumbnail: String
        let images: [String]
    }
}

extension Request {
    static func products(skip: Int = 0, limit: Int = 30) -> Request {
        Request(
            method: .get,
            path: Products.path,
            queries: ["skip": "\(skip)", "limit": "\(limit)"]
        )
    }
}

fileprivate extension Request {
    init(method: RequestMethod, path: String, queries: [String: String]) {
        self.scheme = Products.scheme
        self.host = Products.host
        self.headers = nil
        self.method = method
        self.path = path
        self.queries = queries
        self.body = nil
    }
}
