
import SwiftUI

struct ProductView: View {
    let product: Products.Product
    
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
                
                Text(product.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Button("Add to Cart") {
                    //
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .multilineTextAlignment(.leading)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Products.stub.products[0])
    }
}
