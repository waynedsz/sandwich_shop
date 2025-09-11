<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> 2157fc0 (Add initial prompt.md)
## LLM Prompt for Implementing Cart Modification Features in a Flutter Sandwich Shop App

I am building a Flutter app for a sandwich shop. The app has two main pages:
- **Order Screen:** Users select sandwiches and add them to their cart.
- **Cart Screen:** Users view the items in their cart and see the total price.

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5b8512d (Update prompt.md)
### Relevant Models and Repository

- **Sandwich (`lib/models/sandwich.dart`):**
  - Has `SandwichType`, `BreadType`, and a `bool isFootlong` for size.
  - Each sandwich has a `name` and an `image` getter for display.
- **Cart (`lib/models/cart.dart`):**
  - Stores a map of `Sandwich` to quantity.
  - Methods: `add(Sandwich, {quantity})`, `remove(Sandwich, {quantity})`, `clear()`, `getQuantity(Sandwich)`.
  - `totalPrice` is calculated using the `PricingRepository`.
  - If removing more than the current quantity, the item is removed entirely.
- **PricingRepository (`lib/repositories/pricing_repository.dart`):**
  - `calculatePrice({required int quantity, required bool isFootlong})` returns the price for a sandwich based on size and quantity.

### Current UI

- The cart page lists each sandwich, its size, bread type, quantity, and price.
- The total price is shown at the bottom.
- There is a "Back to Order" button.
<<<<<<< HEAD

---

## Features to Implement

=======
I want to implement features that allow users to modify the items in their cart. Here are the features I need, with clear descriptions and expected behaviors:

---

>>>>>>> 2157fc0 (Add initial prompt.md)
=======

---

## Features to Implement

>>>>>>> 5b8512d (Update prompt.md)
### 1. Change Quantity of an Item

**Description:**  
Allow users to increase or decrease the quantity of a specific sandwich in their cart.

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5b8512d (Update prompt.md)
**Requirements:**  
- Each cart item should display "+" and "–" buttons to adjust quantity.
- Tapping "+" increases the quantity by 1.
- Tapping "–" decreases the quantity by 1.
- If the quantity is reduced below 1, the item should be removed from the cart.
- The total price should update automatically.
- The UI should update immediately to reflect changes.

**Edge Cases:**  
- If the user tries to decrease the quantity when it is 1, the item should be removed.
- Prevent negative quantities.
<<<<<<< HEAD
=======
**Expected Behavior:**  
- The cart screen should display the current quantity for each item.
- Users can tap "+" to increase or "–" to decrease the quantity.
- If the quantity is decreased to 0, the item should be removed from the cart.
- The total price should update automatically as the quantity changes.
>>>>>>> 2157fc0 (Add initial prompt.md)
=======
>>>>>>> 5b8512d (Update prompt.md)

---

### 2. Remove an Item from the Cart

**Description:**  
Allow users to remove a sandwich from their cart entirely.

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5b8512d (Update prompt.md)
**Requirements:**  
- Each cart item should have a "Remove" button (e.g., a trash icon).
- Tapping "Remove" deletes the item from the cart.
- The total price updates accordingly.
- Show a snackbar or other feedback when an item is removed.
<<<<<<< HEAD
=======
**Expected Behavior:**  
- Each item in the cart should have a "Remove" button (e.g., a trash icon).
- When the user taps "Remove," the item is deleted from the cart.
- The total price updates to reflect the removal.
>>>>>>> 2157fc0 (Add initial prompt.md)
=======
>>>>>>> 5b8512d (Update prompt.md)

---

### 3. Edit Item Details (Optional)

**Description:**  
<<<<<<< HEAD
<<<<<<< HEAD
Allow users to edit details of a sandwich in their cart (e.g., change bread type, size, or sandwich type).

**Requirements:**  
- Each cart item should have an "Edit" button.
- Tapping "Edit" opens a dialog or navigates to a screen to modify sandwich options.
- After saving, the cart updates the item (or replaces it if the combination is new).
- The price and UI update accordingly.

---

### General UI and Behavior Requirements

- All changes should be reflected immediately in the UI.
- The cart's total price should always be accurate.
- The cart should handle empty states gracefully (e.g., show a message if the cart is empty).
- Provide user feedback (e.g., snackbar) for actions like removing or updating items.
- The UI should prevent adding more than a maximum allowed quantity (see `OrderScreen.maxQuantity`).

---

<<<<<<< HEAD
**Please provide Flutter code and UI suggestions to implement these features.**
>>>>>>> 2157fc0 (Add initial prompt.md)
=======
**Please provide Flutter code and UI suggestions to implement these features, using the provided models and repository.**
>>>>>>> 5b8512d (Update prompt.md)
=======
Allow users to edit details of a sandwich in their cart (e.g., change bread type, toppings, or size).
=======
Allow users to edit details of a sandwich in their cart (e.g., change bread type, size, or sandwich type).
>>>>>>> 5b8512d (Update prompt.md)

**Requirements:**  
- Each cart item should have an "Edit" button.
- Tapping "Edit" opens a dialog or navigates to a screen to modify sandwich options.
- After saving, the cart updates the item (or replaces it if the combination is new).
- The price and UI update accordingly.

---

### General UI and Behavior Requirements

- All changes should be reflected immediately in the UI.
- The cart's total price should always be accurate.
- The cart should handle empty states gracefully (e.g., show a message if the cart is empty).
- Provide user feedback (e.g., snackbar) for actions like removing or updating items.
- The UI should prevent adding more than a maximum allowed quantity (see `OrderScreen.maxQuantity`).

---

<<<<<<< HEAD
**Please provide Flutter code and UI suggestions to implement these features.**
>>>>>>> 2157fc0 (Add initial prompt.md)
=======
**Please provide Flutter code and UI suggestions to implement these features, using the provided models and repository.**
>>>>>>> 5b8512d (Update prompt.md)
