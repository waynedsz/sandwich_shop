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
- [x] Write unit and widget tests for all cart modification actions.

---

## Feature: Profile Screen and Navigation

### Prompt used with AI assistant

> Add a new profile screen to the Flutter Sandwich Shop app.  
> The screen should:
> - Be implemented as a separate widget in `lib/views/profile_screen.dart`.
> - Show a simple, non-persistent profile form with fields for name, email, and phone.  
> - Include a primary button to "Save profile" that only shows a SnackBar (no backend or real persistence yet).  
> - Be reachable from the `OrderScreen` via a link or button at the bottom of the order screen that navigates using a named route.  
> - Register a `/profile` route in `MaterialApp` in `main.dart`.  
> - Include widget tests that verify the presence of the main UI elements on the profile screen and basic interaction (e.g. tapping the Save button shows feedback or at least does not throw).  
> Use concise code and avoid unnecessary complexity.

### Requirements for the Profile Feature

- A new `ProfileScreen` widget SHALL be implemented in `lib/views/profile_screen.dart`.
- `ProfileScreen` SHALL:
  - Use a `Scaffold` with an `AppBar` titled "Your Profile".
  - Contain at least three input fields: name, email, and phone.
  - Expose semantic identifiers (e.g. `Key`s) for the fields and the save button so tests can locate them.
  - Show a "Save profile" button that provides user feedback (e.g. SnackBar) but performs no real persistence.
- `MaterialApp` in `lib/main.dart` SHALL register a named route `/profile` mapped to `ProfileScreen`.
- `OrderScreen` SHALL show a link/button at the bottom that navigates to `/profile` using `Navigator.pushNamed`.
- Widget tests SHALL be added for the new profile screen:
  - Tests MUST verify that the title, input fields, and save button are rendered.
  - Tests SHOULD verify that tapping the save button is handled without errors and triggers some form of feedback if feasible.