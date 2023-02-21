
// NOTE: reused code from existing project ⏱

import SwiftUI

struct ProductCell: View {
    let product: Product
    
    var body: some View {
        ProductImage(url: URL(string: product.thumbnail))
            .background(.white)
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
