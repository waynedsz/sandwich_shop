## Prompt: Implement Cart Modification Features in Flutter Sandwich Shop App

I have a Flutter app for a sandwich shop with these models:
- **Sandwich**: (fields: type, size, bread type)
- **Cart**: (methods: add, remove, clear; calculates total price)
- **Pricing** repository: (calculates prices based on quantity and size; sandwich type and bread do not affect price)

The app has:
- An **OrderScreen** where users select sandwiches and add them to their cart.
- A **CartScreen** where users see their cart items and the total price.

I want to add the following cart modification features:

### 1. Change Quantity of an Item
- **Description:** Users can increase or decrease the quantity of a sandwich in their cart.
- **Behavior:**  
  - Increasing quantity updates the cart and recalculates the total price.
  - Decreasing quantity updates the cart; if quantity reaches zero, remove the item.
  - UI should have plus/minus buttons for quantity adjustment.

### 2. Remove an Item from the Cart
- **Description:** Users can remove a sandwich from their cart.
- **Behavior:**  
  - Removing an item deletes it from the cart and updates the total price.
  - UI should have a clear remove button/icon.

### 3. (Optional) Clear the Entire Cart
- **Description:** Users can remove all items from the cart at once.
- **Behavior:**  
  - "Clear Cart" removes all items and resets the total price.
  - Show a confirmation dialog before clearing.

**Please provide:**
- UI changes needed for each feature.
- Expected user flow.
- Suggestions for Flutter widgets or state management.
- Example code snippets for integrating these features, using the existing models and repository.