<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======

>>>>>>> 05c2002 (Update README.md to enhance app description and folder structure details)
# Sandwich Shop
>>>>>>> e901868 (Add a README for stage 1)

This is a Flutter app for ordering sandwiches. It supports cart modification (adjust quantity, remove items) and runs on web, Android, and desktop.

GitHub: https://github.com/waynedsz/sandwich_shop

## Folder Structure

```
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

## Quick Start

Clone the repo and run:

```bash
flutter pub get
flutter run
```

## Install the essential tools

1. **Terminal**:

    - **macOS** – use the built-in Terminal app by pressing **⌘ + Space**, typing **Terminal**, and pressing **Return**.
    - **Windows** – open the start menu using the **Windows** key. Then enter **cmd** to open the **Command Prompt**. Alternatively, you can use **Windows PowerShell** or **Windows Terminal**.

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
=======
2.  **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> 05897b7 (Update README for branch 2)
=======
2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> 69fa965 (📝 Update README.md)
=======
2.  **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> 05897b7 (Update README for branch 2)
=======
2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> 6e0cdd0 (📝 Update README.md)
=======
2.  **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> 05897b7 (Update README for branch 2)
=======
2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
>>>>>>> d662e4e (📝 Update README.md)
    If this is missing, download the installer from [Git's official site](https://git-scm.com/downloads?utm_source=chatgpt.com).

3. **Package managers**:

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 816cadc (first commit)
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with
     `brew --version`; if missing, follow the instructions on the
     [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with
     `choco --version`; if missing, follow the instructions on the
     [Chocolatey installation page](https://chocolatey.org/install).
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> dc9aed5 (Minor updates in README)
=======
    - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
    - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> 05897b7 (Update README for branch 2)
=======
    - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
    - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> 05897b7 (Update README for branch 2)
=======
    - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
    - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> 05897b7 (Update README for branch 2)
=======
    - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
    - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> 05897b7 (Update README for branch 2)

4. **Flutter SDK** – verify that you have `flutter` installed and it is working with `flutter doctor`; if missing, install it using your package manager:

    - **macOS**: `brew install --cask flutter`
    - **Windows**: `choco install flutter`

5. **Visual Studio Code** – verify that you have `code` installed with `code --version`; if missing, use your package manager to install it:

    - **macOS**: `brew install --cask visual-studio-code`
    - **Windows**: `choco install vscode`

## Get the code

### If this is your first time working on this project

Enter the following commands in your terminal to clone the repository and
open it in Visual Studio Code.
You may want to change directory (`cd`) to the directory where you want to clone the
repository first.

```bash
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git clone --branch 5 https://github.com/manighahrmani/sandwich_shop
=======
git clone --branch 6 https://github.com/manighahrmani/sandwich_shop
>>>>>>> 69fa965 (📝 Update README.md)
=======
git clone --branch 7 https://github.com/manighahrmani/sandwich_shop
>>>>>>> 6e0cdd0 (📝 Update README.md)
=======
git clone --branch 8 https://github.com/manighahrmani/sandwich_shop
>>>>>>> d662e4e (📝 Update README.md)
cd sandwich_shop
code .
```

### If you have already cloned the repository

Enter the following commands in your terminal to switch to the correct branch.
Remember to `cd` to the directory where you cloned the repository first.

```bash
git fetch origin
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git checkout 5
=======
git checkout 6
>>>>>>> 69fa965 (📝 Update README.md)
=======
git checkout 7
>>>>>>> 6e0cdd0 (📝 Update README.md)
=======
git checkout 8
>>>>>>> d662e4e (📝 Update README.md)
```

## Run the app

Open the integrated terminal in Visual Studio Code by first opening the Command
Palette with **⌘ + Shift + P** (macOS) or **Ctrl + Shift + P** (Windows) and
typing **Terminal: Create New Terminal** then pressing **Enter**.

In the terminal, run the following commands to install the dependencies and run
the app in your web browser:

```bash
flutter pub get
flutter run
```

## Get support

Use [the dedicated Discord channel](https://discord.com/channels/760155974467059762/1370633732779933806)
to ask your questions and get help from the community.
Please provide as much context as possible, including the error messages you are seeing and
screenshots (you can open Discord in your web browser).
>>>>>>> e901868 (Add a README for stage 1)
=======
# sandwich_shop
=======
# Sandwich Shop
>>>>>>> e901868 (Add a README for stage 1)

This is a simple Flutter app that allows users to order sandwiches.
The app is built using Flutter and Dart, and it is designed primarily to be run in a web
browser.

## Install the essential tools

1. **Terminal**:

   - **macOS** – use the built-in Terminal app by pressing **⌘ + Space**, typing **Terminal**, and pressing **Return**.
   - **Windows** – open the start menu using the **Windows** key. Then enter **cmd** to open the **Command Prompt**. Alternatively, you can use **Windows PowerShell** or **Windows Terminal**.

2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
   If this is missing, download the installer from [Git's official site](https://git-scm.com/downloads?utm_source=chatgpt.com).

3. **Package managers**:

<<<<<<< HEAD
<<<<<<< HEAD
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 816cadc (first commit)
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with
     `brew --version`; if missing, follow the instructions on the
     [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with
     `choco --version`; if missing, follow the instructions on the
     [Chocolatey installation page](https://chocolatey.org/install).
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> dc9aed5 (Minor updates in README)

4. **Flutter SDK** – verify that you have `flutter` installed and it is working with `flutter doctor`; if missing, install it using your package manager:

   - **macOS**: `brew install --cask flutter`
   - **Windows**: `choco install flutter`

5. **Visual Studio Code** – verify that you have `code` installed with `code --version`; if missing, use your package manager to install it:

   - **macOS**: `brew install --cask visual-studio-code`
   - **Windows**: `choco install vscode`

## Get the code

### If this is your first time working on this project

Enter the following commands in your terminal to clone the repository and
open it in Visual Studio Code.
You may want to change directory (`cd`) to the directory where you want to clone the
repository first.

```bash
git clone --branch 1 https://github.com/manighahrmani/sandwich_shop
cd sandwich_shop
code .
```

<<<<<<< HEAD
## Run the app in Chrome
=======
### If you have already cloned the repository

Enter the following commands in your terminal to switch to the correct branch.
Remember to `cd` to the directory where you cloned the repository first.

```bash
git fetch origin
git checkout 2
```

## Run the app
>>>>>>> dc9aed5 (Minor updates in README)

Open the integrated terminal in Visual Studio Code by first opening the Command
Palette with **⌘ + Shift + P** (macOS) or **Ctrl + Shift + P** (Windows) and
typing **Terminal: Create New Terminal** then pressing **Enter**.

In the terminal, run the following commands to install the dependencies and run
the app in your web browser:

```bash
flutter pub get
flutter run
```

## Get support

Use [the dedicated Discord channel](https://discord.com/channels/760155974467059762/1370633732779933806)
to ask your questions and get help from the community.
Please provide as much context as possible, including the error messages you are seeing and
screenshots (you can open Discord in your web browser).
>>>>>>> e901868 (Add a README for stage 1)
=======
# sandwich_shop
=======
# Sandwich Shop
>>>>>>> e901868 (Add a README for stage 1)

This is a simple Flutter app that allows users to order sandwiches.
The app is built using Flutter and Dart, and it is designed primarily to be run in a web
browser.

## Install the essential tools

1. **Terminal**:

   - **macOS** – use the built-in Terminal app by pressing **⌘ + Space**, typing **Terminal**, and pressing **Return**.
   - **Windows** – open the start menu using the **Windows** key. Then enter **cmd** to open the **Command Prompt**. Alternatively, you can use **Windows PowerShell** or **Windows Terminal**.

2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
   If this is missing, download the installer from [Git's official site](https://git-scm.com/downloads?utm_source=chatgpt.com).

3. **Package managers**:

<<<<<<< HEAD
<<<<<<< HEAD
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 816cadc (first commit)
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with
     `brew --version`; if missing, follow the instructions on the
     [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with
     `choco --version`; if missing, follow the instructions on the
     [Chocolatey installation page](https://chocolatey.org/install).
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> dc9aed5 (Minor updates in README)

4. **Flutter SDK** – verify that you have `flutter` installed and it is working with `flutter doctor`; if missing, install it using your package manager:

   - **macOS**: `brew install --cask flutter`
   - **Windows**: `choco install flutter`

5. **Visual Studio Code** – verify that you have `code` installed with `code --version`; if missing, use your package manager to install it:

   - **macOS**: `brew install --cask visual-studio-code`
   - **Windows**: `choco install vscode`

## Get the code

### If this is your first time working on this project

Enter the following commands in your terminal to clone the repository and
open it in Visual Studio Code.
You may want to change directory (`cd`) to the directory where you want to clone the
repository first.

```bash
git clone --branch 1 https://github.com/manighahrmani/sandwich_shop
cd sandwich_shop
code .
```

<<<<<<< HEAD
## Run the app in Chrome
=======
### If you have already cloned the repository

Enter the following commands in your terminal to switch to the correct branch.
Remember to `cd` to the directory where you cloned the repository first.

```bash
git fetch origin
git checkout 2
```

## Run the app
>>>>>>> dc9aed5 (Minor updates in README)

Open the integrated terminal in Visual Studio Code by first opening the Command
Palette with **⌘ + Shift + P** (macOS) or **Ctrl + Shift + P** (Windows) and
typing **Terminal: Create New Terminal** then pressing **Enter**.

In the terminal, run the following commands to install the dependencies and run
the app in your web browser:

```bash
flutter pub get
flutter run
```

## Get support

Use [the dedicated Discord channel](https://discord.com/channels/760155974467059762/1370633732779933806)
to ask your questions and get help from the community.
Please provide as much context as possible, including the error messages you are seeing and
screenshots (you can open Discord in your web browser).
>>>>>>> e901868 (Add a README for stage 1)
=======
# sandwich_shop
=======
# Sandwich Shop
>>>>>>> e901868 (Add a README for stage 1)

This is a simple Flutter app that allows users to order sandwiches.
The app is built using Flutter and Dart, and it is designed primarily to be run in a web
browser.

## Install the essential tools

1. **Terminal**:

   - **macOS** – use the built-in Terminal app by pressing **⌘ + Space**, typing **Terminal**, and pressing **Return**.
   - **Windows** – open the start menu using the **Windows** key. Then enter **cmd** to open the **Command Prompt**. Alternatively, you can use **Windows PowerShell** or **Windows Terminal**.

2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
   If this is missing, download the installer from [Git's official site](https://git-scm.com/downloads?utm_source=chatgpt.com).

3. **Package managers**:

<<<<<<< HEAD
<<<<<<< HEAD
For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
>>>>>>> 816cadc (first commit)
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with
     `brew --version`; if missing, follow the instructions on the
     [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with
     `choco --version`; if missing, follow the instructions on the
     [Chocolatey installation page](https://chocolatey.org/install).
=======
   - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
   - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).
>>>>>>> dc9aed5 (Minor updates in README)

4. **Flutter SDK** – verify that you have `flutter` installed and it is working with `flutter doctor`; if missing, install it using your package manager:

   - **macOS**: `brew install --cask flutter`
   - **Windows**: `choco install flutter`

5. **Visual Studio Code** – verify that you have `code` installed with `code --version`; if missing, use your package manager to install it:

   - **macOS**: `brew install --cask visual-studio-code`
   - **Windows**: `choco install vscode`

## Get the code

### If this is your first time working on this project

Enter the following commands in your terminal to clone the repository and
open it in Visual Studio Code.
You may want to change directory (`cd`) to the directory where you want to clone the
repository first.

```bash
git clone --branch 1 https://github.com/manighahrmani/sandwich_shop
cd sandwich_shop
code .
```

<<<<<<< HEAD
## Run the app in Chrome
=======
### If you have already cloned the repository

Enter the following commands in your terminal to switch to the correct branch.
Remember to `cd` to the directory where you cloned the repository first.

```bash
git fetch origin
git checkout 2
```

## Run the app
>>>>>>> dc9aed5 (Minor updates in README)

Open the integrated terminal in Visual Studio Code by first opening the Command
Palette with **⌘ + Shift + P** (macOS) or **Ctrl + Shift + P** (Windows) and
typing **Terminal: Create New Terminal** then pressing **Enter**.

In the terminal, run the following commands to install the dependencies and run
the app in your web browser:

```bash
flutter pub get
flutter run
```

## Get support

Use [the dedicated Discord channel](https://discord.com/channels/760155974467059762/1370633732779933806)
to ask your questions and get help from the community.
Please provide as much context as possible, including the error messages you are seeing and
screenshots (you can open Discord in your web browser).
>>>>>>> e901868 (Add a README for stage 1)
