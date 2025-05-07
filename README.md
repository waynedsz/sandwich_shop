<<<<<<< HEAD
# Sandwich Shop App

A Flutter application for ordering sandwiches with customizable options.

## Features

- Select sandwich type: **six-inch** or **footlong**
- Choose bread type: **white**, **wheat**, or **wholemeal**
- Add a custom note to your order (e.g., "no onions")
- Increase or decrease the quantity of sandwiches (up to a configurable maximum)
- Visual display of your current order, including bread type, sandwich type, quantity, and notes
- Modern UI using Flutter's Material Design

## Project Structure

```
sandwich_shop/
├── lib/
│   ├── main.dart                # Main app entry point and UI
│   ├── views/
│   │   └── app_styles.dart      # Custom text styles for the app
│   └── repositories/
│       └── order_repository.dart # Business logic for managing sandwich orders
├── pubspec.yaml                 # Flutter dependencies
└── README.md                    # Project documentation
```

## How It Works

- The main screen lets users select sandwich size and bread type using a switch and dropdown menu.
- Users can add notes for special requests.
- Quantity is managed with add/remove buttons, limited by a maximum value.
- The current order is displayed with sandwich icons and details.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- A recent version of Dart (comes with Flutter)
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. Clone this repository:
   ```
   git clone https://github.com/waynedsz/sandwich_shop.git
   cd sandwich_shop
   ```

2. Get dependencies:
   ```
   flutter pub get
   ```

3. Run the app:
   ```
   flutter run
   ```

### Project Customization

- You can change the maximum sandwich quantity by editing `OrderScreen(maxQuantity: ...)` in `main.dart`.
- Add more bread types or customize the UI by editing the relevant widgets in `main.dart`.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Widgets](https://docs.flutter.dev/development/ui/widgets/material)

## License

This project is for educational purposes.
=======
# sandwich_shop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 816cadc (first commit)
