
import Foundation

extension Products {
    static var stub: Response {
        Bundle.main.decode("products_response.json", with: decoder)
    }
}
