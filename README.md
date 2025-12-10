# Sandwich Shop

This is a Flutter app for ordering sandwiches. It supports cart modification (adjust quantity, remove items) and runs on web, Android, and desktop.

GitHub: https://github.com/waynedsz/sandwich_shop

## Folder Structure

```text
sandwich_shop/
├── analysis_options.yaml
├── android/
│   ├── app/
│   │   └── src/
│   ├── build.gradle.kts
│   ├── gradle/
│   ├── gradle.properties
│   ├── local.properties
│   └── settings.gradle.kts
├── assets/
│   └── images/
├── devtools_options.yaml
├── integration_test/
│   └── app_test.dart
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   ├── cart.dart
│   │   ├── sandwich.dart
│   │   └── saved_order.dart
│   ├── repositories/
│   │   └── pricing_repository.dart
│   ├── services/
│   │   └── database_service.dart
│   ├── views/
│   │   ├── app_styles.dart
│   │   ├── cart_screen.dart
│   │   ├── checkout_screen.dart
│   │   ├── order_history_screen.dart
│   │   ├── order_screen.dart
│   │   ├── profile_screen.dart
│   │   └── settings_screen.dart
│   └── widgets/
│       └── common_widgets.dart
├── linux/
├── macos/
├── prompt.md
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── requirement.md
├── test/
│   ├── helpers/
│   │   └── test_helpers.dart
│   ├── models/
│   │   ├── cart_test.dart
│   │   ├── sandwich_test.dart
│   │   └── saved_order_test.dart
│   ├── repositories/
│   │   └── pricing_repository_test.dart
│   ├── services/
│   │   └── database_service_test.dart
│   ├── views/
│   │   ├── cart_screen_test.dart
│   │   ├── checkout_screen_test.dart
│   │   ├── order_history_screen_test.dart
│   │   ├── order_screen_test.dart
│   │   ├── profile_screen_test.dart
│   │   └── settings_screen_test.dart
│   ├── widgets/
│   │   └── common_widgets_test.dart
│   └── widget_test.dart
├── test_driver/
├── web/
│   ├── favicon.png
│   ├── icons/
│   ├── index.html
│   └── manifest.json
├── windows/
└── ...
```

## How It Works

- The main screen lets users select sandwich size and bread type using a switch and dropdown menu.
- Users can add notes for special requests.
- Quantity is managed with add/remove buttons, limited by a maximum value.
- The current order is displayed with sandwich icons and details.
- A cart tracks multiple sandwiches, and a checkout flow shows an order summary and total price.

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- A recent version of Dart (comes with Flutter)
- An IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/waynedsz/sandwich_shop.git
   cd sandwich_shop
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Development Notes

- The app uses a `Cart` model and `PricingRepository` to calculate totals.
- Widget tests live under `test/` and cover models, screens, and common widgets.
- You can customise styles (including global font size) in `lib/views/app_styles.dart`.

## Customisation

- Change the initial screen or navigation flow in `lib/main.dart`.
- Add more sandwich types or bread options by editing `sandwich.dart` and the `OrderScreen` UI.
- Modify prices or pricing logic in `pricing_repository.dart`.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Material Design Widgets](https://docs.flutter.dev/development/ui/widgets/material)

## License

This project is for educational purposes.
