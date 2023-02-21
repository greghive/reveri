
import SwiftUI

struct CartCell: View {
    let product: Products.Product
    
    var body: some View {
        Text(product.title)
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCell(product: Store.preview.cart[0])
    }
}
