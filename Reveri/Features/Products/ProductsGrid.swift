// NOTE: reused code from existing project ⏱

import SwiftUI

struct ProductsGrid: View {
    let products: [Products.Product]
    let numColumns: Int
    var selection: (Products.Product) -> Void
    
    var body: some View {
        let spacing: CGFloat = 10
        let columms = [GridItem](repeatElement(GridItem(.flexible()), count: numColumns))
        
        ScrollView {
            LazyVGrid(columns: columms, spacing: spacing, content: {
                ForEach(products) { product in
                    Button {
                        selection(product)
                    } label: {
                        ProductCell(product: product)
                    }
                }
            })
            .padding(spacing)
            .listStyle(.plain)
        }
    }
}

struct ProductsGrid_Previews: PreviewProvider {
    static var previews: some View {
        ProductsGrid(products: Products.stub.products, numColumns: 2, selection: { _ in  })
    }
}
