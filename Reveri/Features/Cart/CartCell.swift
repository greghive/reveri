
import SwiftUI

struct CartCell: View {
    let product: Products.Product
    
    var body: some View {
        HStack(spacing: 12) {
            ProductImage(url: URL(string: product.thumbnail))
                .background(.white)
                .frame(width: 60, height: 60)
                .aspectRatio(1, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .bold()
                
                Text(product.description)
                    .font(.caption)
                    .lineLimit(1)
            }
            
            Spacer()
        }
    }
}

struct CartCell_Previews: PreviewProvider {
    static var previews: some View {
        CartCell(product: Store.preview.cart[0])
    }
}
