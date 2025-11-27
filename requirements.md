# Cart Modification Feature Requirements

## 1. Feature Description and Purpose

**Feature:**  
Enable users to modify the contents of their cart in the Sandwich Shop Flutter app. This includes changing the quantity of sandwiches, removing individual items, and clearing the entire cart.

**Purpose:**  
To provide users with flexibility and control over their orders, improving the overall user experience and reducing errors before checkout.

---

## 2. User Stories

### 2.1. Change Quantity of a Sandwich in Cart
- **As a** user,
- **I want** to increase or decrease the quantity of a sandwich in my cart,
- **So that** I can adjust my order without having to remove and re-add items.

### 2.2. Remove a Sandwich from Cart
- **As a** user,
- **I want** to remove a specific sandwich from my cart,
- **So that** I can easily correct mistakes or change my mind about an item.

### 2.3. Clear the Entire Cart
- **As a** user,
- **I want** to remove all items from my cart at once,
- **So that** I can quickly start over if I want to change my entire order.

---

## 3. Acceptance Criteria

### 3.1. Change Quantity of a Sandwich
- [x] Each cart item displays its current quantity with plus (+) and minus (–) buttons.
- [x] Tapping the plus button increases the quantity by 1, up to a defined maximum (e.g., 5).
- [x] Tapping the minus button decreases the quantity by 1.
- [x] If the quantity reaches zero, the item is removed from the cart.
- [x] The total price updates immediately when the quantity changes.

### 3.2. Remove a Sandwich from Cart
- [x] Each cart item has a visible remove button (e.g., trash can icon).
- [x] Tapping the remove button deletes the item from the cart.
- [x] The total price updates immediately after removal.

### 3.3. Clear the Entire Cart
- [x] There is a "Clear Cart" button on the cart screen.
- [x] Tapping "Clear Cart" prompts the user with a confirmation dialog.
- [x] Confirming the dialog removes all items from the cart and resets the total price to zero.
- [x] Cancelling the dialog leaves the cart unchanged.

---

## 4. Subtasks

- [x] Update the Cart model to support quantity changes and item removal.
- [x] Update the CartScreen UI to display quantity controls and remove buttons for each item.
- [x] Implement the "Clear Cart" button and confirmation dialog.
- [x] Ensure the total price is recalculated and displayed correctly after any modification.
- [ ] Write unit and widget tests for all cart modification actions.