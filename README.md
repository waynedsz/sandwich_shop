# 🍞 Sandwich Shop App

*A Flutter application for ordering customizable sandwiches.*

## 📌 Overview

Sandwich Shop is a Flutter app where users can build and customize
sandwiches, add them to a cart, adjust quantities, and complete
checkout.\
The project includes full business logic, state management with
Provider, reusable UI components, and unit/widget tests.

## ⭐ Features

-   Select **sandwich type** (Veggie Delight, Chicken Teriyaki, etc.)\
-   Choose **size**: Six-inch or Footlong\
-   Choose **bread type**: White, Wheat, Wholemeal\
-   Add multiple items with quantity controls\
-   Live **cart screen** with update, delete, and clear functions\
-   A **profile screen** for saving basic user information\
-   **Settings screen** to modify app behavior (e.g., font size)\
-   Checkout flow with a **payment confirmation simulation**\
-   Fully tested with **unit tests & widget tests**

## 📁 Project Structure

    sandwich_shop/
    ├── lib/
    │   ├── main.dart
    │   ├── models/
    │   │   ├── sandwich.dart
    │   │   └── cart.dart
    │   ├── views/
    │   │   ├── order_screen.dart
    │   │   ├── cart_screen.dart
    │   │   ├── checkout_screen.dart
    │   │   ├── profile_screen.dart
    │   │   └── settings_screen.dart
    │   ├── widgets/
    │   │   └── styled_button.dart
    │   └── repositories/
    │       └── pricing_repository.dart
    ├── test/
    │   ├── sandwich_test.dart
    │   ├── cart_test.dart
    │   ├── pricing_repository_test.dart
    │   ├── cart_screen_test.dart
    │   └── checkout_screen_test.dart
    ├── assets/
    │   └── images/
    │       ├── logo.png
    │       ├── veggieDelight_footlong.png
    │       ├── veggieDelight_six_inch.png
    │       ├── chickenTeriyaki_footlong.png
    │       ├── chickenTeriyaki_six_inch.png
    │       └── ...other images
    └── pubspec.yaml

## 🚀 Getting Started

### **Prerequisites**

-   Flutter SDK\
-   Dart\
-   Git\
-   VS Code or Android Studio

Verify installations:

    flutter doctor
    git --version

## 📥 Installation

### Clone the repository

    git clone https://github.com/YOUR_USERNAME/sandwich_shop.git
    cd sandwich_shop

### Install dependencies

    flutter pub get

### Run the app

    flutter run

## 🧪 Running Tests

    flutter test

## 🔧 Customization

### Change default maximum quantity

    OrderScreen(maxQuantity: 10)

### Modify sandwich pricing

    isFootlong ? 11.00 : 7.00;

## 🛠️ Technologies Used

-   Flutter\
-   Dart\
-   Provider\
-   Material Design\
-   Unit & Widget Testing

## 📜 License

This project is for **educational use only**.
