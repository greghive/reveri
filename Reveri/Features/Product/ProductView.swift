
import SwiftUI

struct ProductView: View {
    let product: Product
    let store: Store
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            
            ProductImage(url: URL(string: product.thumbnail))
                .background(.white)
                .frame(maxWidth: .infinity, maxHeight: 300)
                .aspectRatio(1, contentMode: .fit)
                .clipped()
            
            VStack(spacing: 12) {
            
                Text(product.title)
                    .font(.title)
                    .bold()
                
                Text("£\(product.price)")
                    .font(.title)
                    .bold()
                
                Text(product.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                buyButton
                .buttonStyle(.borderedProminent)
                
                if product.inStock {
                    Text("(Stock: \(product.stock))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
        .multilineTextAlignment(.leading)
        .edgesIgnoringSafeArea(.top)
    }
    
    @ViewBuilder private var buyButton: some View {
        if product.inStock {
            Button("BUY") {
                store.addToCart(product)
                dismiss()
            }
        } else {
            Button("SOLD OUT") {
                dismiss()
            }
            .tint(.gray)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Products.stub.products[0], store: .preview)
            .previewDisplayName("In Stock")
        ProductView(product: .outOfStock, store: .preview)
            .previewDisplayName("Out of Stock")
    }
}
