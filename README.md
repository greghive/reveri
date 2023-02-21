### Note: several types from previous projects were used to speed up development:
- Networking: `API.swift` and `Request.swift`.
- Features / Products: `ProductsGrid.swift`, `ProductCell.swift` and `ProductImage.swift`.
- PreviewContent: `Bundle+Data.swift`.

### Known issues skipped due to time limit:
- Products can only be removed from the cart. You cannot increase the number of a specific item.
- Products API results are not paged. They are fetched using default values, explicitly defined in `Products.swift`.
- No error handling on the get products publisher chain. Simply replaces errors with an empty array.
- The discount percentage is not applied to any pricing.

### Next step improvements with more time would be:
- Group cart items and add a stepper UI to increment and decrement numbers of specific items from within the cart.
- Page products API results.
- Handle API errors and update the interface with a user facing message.
- Number and currency formatter for cart total.
- Add title and price labels to the cell in the products grid.
- Paging product images in the product detail screen.
- Filter or sort products by category in the products screen.
- Add star rating UI.

