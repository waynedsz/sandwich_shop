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

## License

# Sandwich Shop App

A comprehensive Flutter application for ordering custom sandwiches. This app demonstrates modern Flutter development practices, including state management, user input handling, and test-driven development.

## Features
- Select sandwich type: Footlong or Six-inch
- Choose quantity (with min/max limits)
- Add special order notes
- Toggle sandwich toasting
- Real-time price calculation
- Styled, accessible buttons with icons
- Responsive UI for desktop and mobile
- Comprehensive widget and unit tests

## Project Structure
```
lib/
   main.dart                # Main app UI and logic
   models/                  # Data models (cart, sandwich, order)
   repositories/            # Pricing and order logic
   services/                # Database and backend services
   views/                   # Screens and styles
   widgets/                 # Reusable UI components
assets/
   images/                  # App images
   ...
test/
   widget_test.dart         # Widget tests for UI and interaction
   repositories/            # Unit tests for repositories
integration_test/
   app_test.dart            # Integration tests
```

## Getting Started
1. Install [Flutter](https://flutter.dev/docs/get-started/install) and required SDKs.
2. Run `flutter pub get` to fetch dependencies.
3. Launch the app:
    ```
    flutter run
    ```
4. Run tests:
    ```
    flutter test
    ```

## Dependencies
- `cupertino_icons` - iOS style icons
- `provider` - State management
- `shared_preferences` - Local storage
- `sqflite` - SQLite database
- `path` - File path utilities

## Main Files
- `lib/main.dart`: Entry point, UI, and state management
- `lib/repositories/PricingRepository.dart`: Pricing logic
- `test/repositories/pricing_repository_test.dart`: Unit tests for pricing
- `test/widget_test.dart`: Widget tests for UI and interaction

## How It Works
- Users select sandwich type, quantity, and add notes.
- Toasting option and bread type can be toggled.
- Price is calculated in real time using `PricingRepository`.
- Buttons are styled and disabled at quantity limits.
- All features are covered by widget and unit tests.

## Screenshots
_Add screenshots of your app here_

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
MIT