import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD:lib/views/main.dart
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD:lib/views/main.dart
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD:lib/views/main.dart
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
import 'package:sandwich_shop/repositories/PricingRepository.dart';
>>>>>>> 70d9ab4 (Added a pricing repository, unit testing for it and display)
=======
>>>>>>> 816369a (Move main.dart back to lib and update references):lib/main.dart
import 'package:sandwich_shop/views/app_styles.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:sandwich_shop/repositories/order_repository.dart';
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 40459b4 (Added a import to fix errors)
=======
=======

>>>>>>> 4c718f3 (Revert to the old main)
=======

>>>>>>> 4c718f3 (Revert to the old main)
import 'app_styles.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:sandwich_shop/repositories/order_repository.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
=======
import 'package:sandwich_shop/repositories/order_repository.dart';
>>>>>>> 5a7e299 (Use the order repo in main)
=======
import 'package:sandwich_shop/repositories/pricing_repository.dart';
>>>>>>> d04a1a8 (Use pricing repo and heading 2)

enum BreadType { white, wheat, wholemeal }
>>>>>>> 5a7e299 (Use the order repo in main)
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)

import 'package:sandwich_shop/repositories/order_repository.dart';

import 'package:sandwich_shop/repositories/pricing_repository.dart';

enum BreadType { white, wheat, wholemeal }
=======
import 'app_styles.dart';
=======
import 'package:sandwich_shop/views/app_styles.dart';
>>>>>>> 212586f (Move main.dart back to lib):lib/main.dart
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
>>>>>>> 06067ae (Simplify main)
=======
import 'package:sandwich_shop/views/order_screen_view.dart';
>>>>>>> 6ba2694 (Move order screen to its own view)
=======
import 'app_styles.dart';
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)

import 'package:sandwich_shop/repositories/order_repository.dart';

import 'package:sandwich_shop/repositories/pricing_repository.dart';

enum BreadType { white, wheat, wholemeal }
=======
import 'app_styles.dart';
=======
import 'package:sandwich_shop/views/app_styles.dart';
>>>>>>> 212586f (Move main.dart back to lib):lib/main.dart
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
>>>>>>> 06067ae (Simplify main)
=======
import 'package:sandwich_shop/views/order_screen_view.dart';
>>>>>>> 6ba2694 (Move order screen to its own view)

void main() {
  runApp(const App());
}

enum BreadType { white, wheat, wholemeal }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
<<<<<<< HEAD
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: Text('Welcome to the Sandwich Shop!'),
          body: Column(
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrderItemDisplay(3, 'BLT'),
                  OrderItemDisplay(5, 'Club'),
                  OrderItemDisplay(2, 'Veggie'),
                ]),
            Spacer(),
            Center(
              child: Container(
                width: 400,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: OrderItemDisplay(5, 'Footlong'),
=======
      home: OrderScreen(maxQuantity: 5),
    );
  }
}
<<<<<<< HEAD
<<<<<<< HEAD

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  final Cart _cart = Cart();
=======
  late final OrderRepository _orderRepository;
>>>>>>> 5a7e299 (Use the order repo in main)
=======
  final Cart _cart = Cart();
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
  late final OrderRepository _orderRepository;

>>>>>>> 4c718f3 (Revert to the old main)
=======
  final Cart _cart = Cart();
>>>>>>> 06067ae (Simplify main)
  final TextEditingController _notesController = TextEditingController();

  SandwichType _selectedSandwichType = SandwichType.veggieDelight;
  bool _isFootlong = true;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  bool _isToasted = false;
=======

>>>>>>> 4c718f3 (Revert to the old main)
=======
>>>>>>> 06067ae (Simplify main)
  BreadType _selectedBreadType = BreadType.white;
<<<<<<< HEAD
<<<<<<< HEAD
  int _quantity = 1;
=======
  late final PricingRepository _pricingRepository;
>>>>>>> d04a1a8 (Use pricing repo and heading 2)
=======
  int _quantity = 1;
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======

  BreadType _selectedBreadType = BreadType.white;

  late final PricingRepository _pricingRepository;
>>>>>>> 4c718f3 (Revert to the old main)
=======
  BreadType _selectedBreadType = BreadType.white;
  int _quantity = 1;
>>>>>>> 06067ae (Simplify main)

  @override
  void initState() {
    super.initState();
    _notesController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  void _addToCart() {
    if (_quantity > 0) {
      final Sandwich sandwich = Sandwich(
=======
  void _addToCart() {
    if (_quantity > 0) {
      final sandwich = Sandwich(
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
  void _addToCart() {
    if (_quantity > 0) {
      final Sandwich sandwich = Sandwich(
>>>>>>> 06067ae (Simplify main)
        type: _selectedSandwichType,
        isFootlong: _isFootlong,
        breadType: _selectedBreadType,
      );
<<<<<<< HEAD

      setState(() {
        _cart.add(sandwich, quantity: _quantity);
      });

      String sizeText;
      if (_isFootlong) {
        sizeText = 'footlong';
      } else {
        sizeText = 'six-inch';
      }
      String confirmationMessage =
          'Added $_quantity $sizeText ${sandwich.name} sandwich(es) on ${_selectedBreadType.name} bread to cart';

<<<<<<< HEAD
      ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
      SnackBar snackBar = SnackBar(
        content: Text(confirmationMessage),
        duration: const Duration(seconds: 2),
      );
      scaffoldMessenger.showSnackBar(snackBar);
=======
      print(confirmationMessage);
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
  VoidCallback? _getIncreaseCallback() {
    if (_orderRepository.canIncrement) {
      return () => setState(_orderRepository.increment);
>>>>>>> 4c718f3 (Revert to the old main)
    }

<<<<<<< HEAD
  VoidCallback? _getAddToCartCallback() {
    if (_quantity > 0) {
      return _addToCart;
<<<<<<< HEAD
=======
  VoidCallback? _getIncreaseCallback() {
    if (_orderRepository.canIncrement) {
      return () => setState(_orderRepository.increment);
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
    }
    return null;
  }

<<<<<<< HEAD
  VoidCallback? _getDecreaseCallback() {
    if (_orderRepository.canDecrement) {
      return () => setState(_orderRepository.decrement);
>>>>>>> 5a7e299 (Use the order repo in main)
    }
    return null;
  }

  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    List<DropdownMenuEntry<SandwichType>> entries = [];
    for (SandwichType type in SandwichType.values) {
      Sandwich sandwich =
          Sandwich(type: type, isFootlong: true, breadType: BreadType.white);
      DropdownMenuEntry<SandwichType> entry = DropdownMenuEntry<SandwichType>(
        value: type,
        label: sandwich.name,
      );
      entries.add(entry);
    }
    return entries;
=======
  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    return SandwichType.values.map((type) {
      return DropdownMenuEntry<SandwichType>(
        value: type,
        label:
            Sandwich(type: type, isFootlong: true, breadType: BreadType.white)
                .name,
      );
    }).toList();
=======
=======

      setState(() {
        _cart.add(sandwich, quantity: _quantity);
      });

      String sizeText;
      if (_isFootlong) {
        sizeText = 'footlong';
      } else {
        sizeText = 'six-inch';
      }
      String confirmationMessage =
          'Added $_quantity $sizeText ${sandwich.name} sandwich(es) on ${_selectedBreadType.name} bread to cart';

      debugPrint(confirmationMessage);
    }
  }

  VoidCallback? _getAddToCartCallback() {
    if (_quantity > 0) {
      return _addToCart;
    }
>>>>>>> 06067ae (Simplify main)
    return null;
  }

  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    List<DropdownMenuEntry<SandwichType>> entries = [];
    for (SandwichType type in SandwichType.values) {
      Sandwich sandwich =
          Sandwich(type: type, isFootlong: true, breadType: BreadType.white);
      DropdownMenuEntry<SandwichType> entry = DropdownMenuEntry<SandwichType>(
        value: type,
        label: sandwich.name,
      );
      entries.add(entry);
    }
<<<<<<< HEAD

    return null;
>>>>>>> 4c718f3 (Revert to the old main)
=======
    return entries;
>>>>>>> 06067ae (Simplify main)
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadTypeEntries() {
    List<DropdownMenuEntry<BreadType>> entries = [];
    for (BreadType bread in BreadType.values) {
      DropdownMenuEntry<BreadType> entry = DropdownMenuEntry<BreadType>(
        value: bread,
        label: bread.name,
      );
<<<<<<< HEAD
<<<<<<< HEAD
    }).toList();
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadTypeEntries() {
    List<DropdownMenuEntry<BreadType>> entries = [];
    for (BreadType bread in BreadType.values) {
      DropdownMenuEntry<BreadType> entry = DropdownMenuEntry<BreadType>(
        value: bread,
        label: bread.name,
      );
      entries.add(entry);
    }
    return entries;
  }

  String _getCurrentImagePath() {
    final Sandwich sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );
    return sandwich.image;
=======

      entries.add(newEntry);
=======
      entries.add(entry);
>>>>>>> 06067ae (Simplify main)
    }
    return entries;
>>>>>>> 4c718f3 (Revert to the old main)
  }

  String _getCurrentImagePath() {
    final Sandwich sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );
    return sandwich.image;
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    final pricingRepository = PricingRepository(
      quantity: _orderRepository.quantity,
      isFootlong: _isFootlong,
    );
    final totalPrice = pricingRepository.getTotalPrice();
=======
=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
>>>>>>> d04a1a8 (Use pricing repo and heading 2)
=======
>>>>>>> 4c718f3 (Revert to the old main)
    final double totalPrice = _pricingRepository.calculatePrice(
      quantity: _orderRepository.quantity,
      isFootlong: _isFootlong,
    );

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> d04a1a8 (Use pricing repo and heading 2)
=======
>>>>>>> d04a1a8 (Use pricing repo and heading 2)
    String sandwichType = 'footlong';
=======
    String sandwichType = 'footlong';

>>>>>>> 4c718f3 (Revert to the old main)
=======
    String sandwichType = 'footlong';

>>>>>>> 4c718f3 (Revert to the old main)
    if (!_isFootlong) {
      sandwichType = 'six-inch';
    }

    String noteForDisplay;
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 4c718f3 (Revert to the old main)
=======

>>>>>>> 4c718f3 (Revert to the old main)
    if (_notesController.text.isEmpty) {
      noteForDisplay = 'No notes added.';
    } else {
      noteForDisplay = _notesController.text;
    }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
>>>>>>> 06067ae (Simplify main)
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
>>>>>>> 06067ae (Simplify main)
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: const Text(
          'Sandwich Counter',
          style: heading1,
        ),
      ),
<<<<<<< HEAD
<<<<<<< HEAD
      body: Center(
<<<<<<< HEAD
        child: Column(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 4c718f3 (Revert to the old main)
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _orderRepository.quantity,
              itemType: sandwichType,
              breadType: _selectedBreadType,
              orderNote: noteForDisplay,
            ),
<<<<<<< HEAD
            Text(
              'Total Price: £${totalPrice.toStringAsFixed(2)}',
              style: heading1,
            ),
=======
>>>>>>> 4c718f3 (Revert to the old main)
            const SizedBox(height: 20),
            Text(
              'Total Price: £${totalPrice.toStringAsFixed(2)}',
              style: heading2,
<<<<<<< HEAD
=======
=======
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownMenu<SandwichType>(
              width: double.infinity,
              label: const Text('Sandwich Type'),
              textStyle: normalText,
              initialSelection: _selectedSandwichType,
              onSelected: (SandwichType? value) {
                if (value != null) {
                  setState(() => _selectedSandwichType = value);
                }
              },
              dropdownMenuEntries: _buildSandwichTypeEntries(),
<<<<<<< HEAD
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
      body: Center(
<<<<<<< HEAD
        child: Column(
<<<<<<< HEAD
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _orderRepository.quantity,
              itemType: sandwichType,
              breadType: _selectedBreadType,
              orderNote: noteForDisplay,
>>>>>>> 4c718f3 (Revert to the old main)
            ),
            const SizedBox(height: 20),
            Text(
              'Total Price: £${totalPrice.toStringAsFixed(2)}',
              style: heading2,
<<<<<<< HEAD
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
>>>>>>> 4c718f3 (Revert to the old main)
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('six-inch', style: normalText),
                Switch(
                  key: const Key('sandwichTypeSwitch'),
                  value: _isFootlong,
                  onChanged: (value) => setState(() => _isFootlong = value),
                ),
                const Text('Footlong', style: normalText),
              ],
            ),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('untoasted', style: normalText),
                Switch(
                  key: const Key('toastedSwitch'),
                  value: _isToasted,
                  onChanged: (value) {
                    setState(() => _isToasted = value);
                  },
                ),
                const Text('toasted', style: normalText),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButton<BreadType>(
              value: _selectedBreadType,
              items: BreadType.values.map((bread) {
                return DropdownMenuItem<BreadType>(
                  value: bread,
                  child: Text(bread.name, style: normalText),
                );
              }).toList(),
              onChanged: _onBreadTypeSelected,
              style: normalText,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                key: const Key('notes_textfield'),
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (e.g., no onions)',
                ),
>>>>>>> 929ec89 (Add a new button for toasted or untoasted bread)
              ),
            ),
            Spacer(),
=======
=======
import 'app_styles.dart';
<<<<<<< HEAD
>>>>>>> 115f280 (Separate styles to app_styles)
=======
import 'package:sandwich_shop/repositories/order_repository.dart';
>>>>>>> 5a7e299 (Use the order repo in main)
=======
=======
>>>>>>> 1f69015 (Add sandwich.dart & remove order_repository)
import 'package:sandwich_shop/repositories/pricing_repository.dart';
>>>>>>> d04a1a8 (Use pricing repo and heading 2)

enum BreadType { white, wheat, wholemeal }
=======
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';
>>>>>>> fd75677 (removed enum)
=======
import 'app_styles.dart';
>>>>>>> 115f280 (Separate styles to app_styles)

enum BreadType { white, wheat, wholemeal }
=======
=======
import 'package:provider/provider.dart';
import 'package:sandwich_shop/models/cart.dart';
>>>>>>> 2a7f09c (added provider package, updated cart.dart & main.dart)
import 'package:sandwich_shop/views/order_screen.dart';
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> fba1f70 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
=======
import 'package:sandwich_shop/views/about_screen.dart';
<<<<<<< HEAD
>>>>>>> 46dcf48 (Update about screen & main to work together)
=======
import 'package:sandwich_shop/views/profile_screen.dart';
>>>>>>> beea757 (Update requirements.md)
=======
import 'app_styles.dart';
>>>>>>> 115f280 (Separate styles to app_styles)

enum BreadType { white, wheat, wholemeal }
=======
import 'package:sandwich_shop/views/order_screen.dart';
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
=======
import 'package:sandwich_shop/views/app_styles.dart';
>>>>>>> 2f19def (update main.dart to load the saved font size)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStyles.loadFontSize();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    ThemeData theme = ThemeData(
=======

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    final ThemeData theme = ThemeData(
>>>>>>> 816cadc (first commit)
=======

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    final ThemeData theme = ThemeData(
>>>>>>> 816cadc (first commit)
=======

/// Main entry file for the Sandwich Shop Flutter application.
///
/// Runs [SandwichShopApp].
void main() {
  runApp(const SandwichShopApp());
}

/// Root widget for the Sandwich Shop application.
class SandwichShopApp extends StatelessWidget {
  const SandwichShopApp({super.key});

  /// Builds the root [MaterialApp] with a simple green theme whose
  /// home page is [LandingPage].
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
>>>>>>> 816cadc (first commit)
      useMaterial3: true,
      colorSchemeSeed: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    MaterialApp application = MaterialApp(
      title: 'Sandwich Shop',
      theme: theme,
      home: LandingPage(),
=======
=======
>>>>>>> 816cadc (first commit)
=======
>>>>>>> 816cadc (first commit)
    final MaterialApp application = MaterialApp(
      title: 'Sandwich Shop',
      theme: theme,
      home: const LandingPage(),
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 816cadc (first commit)
=======
>>>>>>> 816cadc (first commit)
=======
>>>>>>> 816cadc (first commit)
    );

    return application;
  }
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
/// First screen that offers the main user actions.
///
/// A [StatefulWidget] is used so callback methods can access
/// [BuildContext] directly.
=======
=======
>>>>>>> 816cadc (first commit)
=======
>>>>>>> 816cadc (first commit)
/// First screen that offers the main choices.
///
/// A stateful widget is used so the handlers can access context
/// directly, avoiding anonymous (lambda) functions.
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 816cadc (first commit)
=======
/// First screen that offers the main user actions.
///
/// A [StatefulWidget] is used so callback methods can access
/// [BuildContext] directly.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
>>>>>>> 816cadc (first commit)
=======
/// First screen that offers the main user actions.
///
/// A [StatefulWidget] is used so callback methods can access
/// [BuildContext] directly.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
>>>>>>> 816cadc (first commit)
=======
/// First screen that offers the main user actions.
///
/// A [StatefulWidget] is used so callback methods can access
/// [BuildContext] directly.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Shows a generic *feature coming soon* [SnackBar].
  void _showNotImplemented() {
    ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    SnackBar bar = SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

  /// Handles presses on *Select from the menu*.
=======
  /// Shows a standard feature‑not‑implemented SnackBar.
=======
  /// Shows a generic *feature coming soon* [SnackBar].
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _showNotImplemented() {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final SnackBar bar = const SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

<<<<<<< HEAD
  /// Called when "Select from the menu" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Select from the menu*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Shows a standard feature‑not‑implemented SnackBar.
=======
  /// Shows a generic *feature coming soon* [SnackBar].
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _showNotImplemented() {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final SnackBar bar = const SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

<<<<<<< HEAD
  /// Called when "Select from the menu" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Select from the menu*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Shows a standard feature‑not‑implemented SnackBar.
=======
  /// Shows a generic *feature coming soon* [SnackBar].
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _showNotImplemented() {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final SnackBar bar = const SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

<<<<<<< HEAD
  /// Called when "Select from the menu" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Select from the menu*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _handleSelectMenuPressed() {
    _showNotImplemented();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Handles presses on *Build your own sandwich*.
=======
  /// Called when "Build your own sandwich" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Build your own sandwich*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Called when "Build your own sandwich" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Build your own sandwich*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Called when "Build your own sandwich" is pressed.
>>>>>>> 816cadc (first commit)
=======
  /// Handles presses on *Build your own sandwich*.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _handleBuildOwnPressed() {
    _showNotImplemented();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Handles the *Account* menu item.
=======
  /// Responds to the "Account" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Account* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Account" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Account* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Account" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Account* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _handleAccountAction() {
    _showNotImplemented();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Handles the *Orders* menu item.
=======
  /// Responds to the "Orders" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Orders* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Orders" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Orders* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Orders" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Orders* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _handleOrdersAction() {
    _showNotImplemented();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Handles the *Log out* menu item.
=======
  /// Responds to the "Log out" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Log out* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Log out" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Log out* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
  /// Responds to the "Log out" menu item.
>>>>>>> 816cadc (first commit)
=======
  /// Handles the *Log out* menu item.
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
  void _handleLogoutAction() {
    _showNotImplemented();
  }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Builds the list of account popup-menu entries.
  List<PopupMenuEntry<String>> _buildAccountMenu(BuildContext context) {
    PopupMenuItem<String> basketItem = PopupMenuItem<String>(
      value: 'basket',
      onTap: _handleAccountAction,
      child: Text('Basket'),
    );

    PopupMenuItem<String> accountItem = PopupMenuItem<String>(
      value: 'account',
      onTap: _handleAccountAction,
      child: Text('Account'),
    );

    PopupMenuItem<String> ordersItem = PopupMenuItem<String>(
      value: 'orders',
      onTap: _handleOrdersAction,
      child: Text('Orders'),
    );

    PopupMenuItem<String> logoutItem = PopupMenuItem<String>(
      value: 'logout',
      onTap: _handleLogoutAction,
      child: Text('Log out'),
    );

    return <PopupMenuEntry<String>>[
      basketItem,
      accountItem,
      ordersItem,
      logoutItem,
    ];
  }

  /// Builds the landing-page widget tree.
  @override
  Widget build(BuildContext context) {
    // Title shown in the AppBar.
    Text screenTitle = Text('Sandwich Shop', style: TextStyle(fontSize: 24));

    // Avatar icon displayed in the AppBar.
    CircleAvatar avatarIcon = CircleAvatar(
      backgroundColor: Colors.green,
      child: Icon(Icons.shopping_basket, size: 24),
    );

    // Primary action buttons.
    ElevatedButton selectMenuButton = ElevatedButton(
      onPressed: _handleSelectMenuPressed,
      child: Text('Select from the menu'),
    );

    ElevatedButton buildOwnButton = ElevatedButton(
      onPressed: _handleBuildOwnPressed,
      child: Text('Build your own sandwich'),
    );

    // Page scaffold.
    Scaffold page = Scaffold(
      appBar: AppBar(
        title: screenTitle,
        actions: <Widget>[
          PopupMenuButton<String>(
            tooltip: 'Account menu',
            icon: avatarIcon,
            itemBuilder: _buildAccountMenu,
=======
=======
>>>>>>> 816cadc (first commit)
=======
>>>>>>> 816cadc (first commit)
  /// Builds the landing‑page user interface.
  @override
  Widget build(BuildContext context) {
    // App‑bar title.
    const Text screenTitle = Text(
      'Welcome to the Sandwich Shop',
      style: TextStyle(fontSize: 24),
    );

    // Avatar icon shown in the app‑bar.
    final CircleAvatar avatarIcon = CircleAvatar(
      backgroundColor: Colors.green,
      child: const Icon(Icons.fastfood, size: 24),
    );

    // Primary action buttons.
    final ElevatedButton selectMenuButton = ElevatedButton(
      onPressed: _handleSelectMenuPressed,
      child: const Text('Select from the menu'),
    );

    final ElevatedButton buildOwnButton = ElevatedButton(
      onPressed: _handleBuildOwnPressed,
      child: const Text('Build your own sandwich'),
    );

    // Drop‑down menu items for the account avatar.
<<<<<<< HEAD
<<<<<<< HEAD
=======
  /// Builds the list of account popup-menu entries.
  List<PopupMenuEntry<String>> _buildAccountMenu(BuildContext context) {
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
>>>>>>> 816cadc (first commit)
=======
  /// Builds the list of account popup-menu entries.
  List<PopupMenuEntry<String>> _buildAccountMenu(BuildContext context) {
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
>>>>>>> 816cadc (first commit)
=======
  /// Builds the list of account popup-menu entries.
  List<PopupMenuEntry<String>> _buildAccountMenu(BuildContext context) {
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
    final PopupMenuItem<String> accountItem = PopupMenuItem<String>(
      value: 'account',
      onTap: _handleAccountAction,
      child: const Text('Account'),
    );

    final PopupMenuItem<String> ordersItem = PopupMenuItem<String>(
      value: 'orders',
      onTap: _handleOrdersAction,
      child: const Text('Orders'),
    );

    final PopupMenuItem<String> logoutItem = PopupMenuItem<String>(
      value: 'logout',
      onTap: _handleLogoutAction,
      child: const Text('Log out'),
    );

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
    return <PopupMenuEntry<String>>[accountItem, ordersItem, logoutItem];
  }

  /// Builds the landing-page widget tree.
  @override
  Widget build(BuildContext context) {
    // Title shown in the AppBar.
    const Text screenTitle = Text(
      'Welcome to the Sandwich Shop',
      style: TextStyle(fontSize: 24),
    );

    // Avatar icon displayed in the AppBar.
    final CircleAvatar avatarIcon = CircleAvatar(
      backgroundColor: Colors.green,
      child: const Icon(Icons.fastfood, size: 24),
    );

    // Primary action buttons.
    final ElevatedButton selectMenuButton = ElevatedButton(
      onPressed: _handleSelectMenuPressed,
      child: const Text('Select from the menu'),
    );

    final ElevatedButton buildOwnButton = ElevatedButton(
      onPressed: _handleBuildOwnPressed,
      child: const Text('Build your own sandwich'),
    );

    // Page scaffold.
<<<<<<< HEAD
<<<<<<< HEAD
    final Scaffold page = Scaffold(
      appBar: AppBar(
        title: screenTitle,
        actions: <Widget>[
          PopupMenuButton<String>(
            tooltip: 'Account menu',
            icon: avatarIcon,
<<<<<<< HEAD
            itemBuilder:
                (BuildContext ctx) => [accountItem, ordersItem, logoutItem],
>>>>>>> 816cadc (first commit)
=======
            itemBuilder: _buildAccountMenu,
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
    // Assemble the scaffold.
=======
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
    final Scaffold page = Scaffold(
      appBar: AppBar(
        title: screenTitle,
        actions: <Widget>[
          PopupMenuButton<String>(
            tooltip: 'Account menu',
            icon: avatarIcon,
<<<<<<< HEAD
            itemBuilder:
                (BuildContext ctx) => [accountItem, ordersItem, logoutItem],
>>>>>>> 816cadc (first commit)
=======
            itemBuilder: _buildAccountMenu,
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
    // Assemble the scaffold.
=======
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
    final Scaffold page = Scaffold(
      appBar: AppBar(
        title: screenTitle,
        actions: <Widget>[
          PopupMenuButton<String>(
            tooltip: 'Account menu',
            icon: avatarIcon,
<<<<<<< HEAD
            itemBuilder:
                (BuildContext ctx) => [accountItem, ordersItem, logoutItem],
>>>>>>> 816cadc (first commit)
=======
            itemBuilder: _buildAccountMenu,
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
          ),
        ],
      ),
      body: Padding(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
<<<<<<< HEAD
<<<<<<< HEAD
          children: <Widget>[
            selectMenuButton,
            const SizedBox(height: 16),
            buildOwnButton,
>>>>>>> 816cadc (first commit)
=======

            const SizedBox(height: 20),

=======
            const SizedBox(height: 10),
>>>>>>> 4c718f3 (Revert to the old main)
=======

            const SizedBox(height: 20),

>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
            DropdownMenu<BreadType>(
              width: double.infinity,
              label: const Text('Bread Type'),
              textStyle: normalText,
              initialSelection: _selectedBreadType,
<<<<<<< HEAD
              onSelected: _onBreadTypeSelected,
              dropdownMenuEntries: _buildDropdownEntries(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                key: const Key('notes_textfield'),
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (e.g., no onions)',
                ),
=======
=======
>>>>>>> 06067ae (Simplify main)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Image.asset(
                _getCurrentImagePath(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Image not found',
                      style: normalText,
                    ),
                  );
                },
<<<<<<< HEAD
>>>>>>> 06067ae (Simplify main)
              ),
=======
              onSelected: (BreadType? value) {
                if (value != null) {
                  setState(() => _selectedBreadType = value);
                }
              },
              dropdownMenuEntries: _buildBreadTypeEntries(),
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
            ),

            const SizedBox(height: 20),
<<<<<<< HEAD
            DropdownMenu<SandwichType>(
              width: double.infinity,
              label: const Text('Sandwich Type'),
              textStyle: normalText,
              initialSelection: _selectedSandwichType,
              onSelected: (SandwichType? value) {
                if (value != null) {
                  setState(() => _selectedSandwichType = value);
                }
              },
              dropdownMenuEntries: _buildSandwichTypeEntries(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Six-inch', style: normalText),
                Switch(
                  value: _isFootlong,
                  onChanged: _onSandwichTypeChanged,
                ),
                const Text('footlong', style: normalText),
              ],
            ),
<<<<<<< HEAD
            const SizedBox(height: 20),
=======
            const SizedBox(height: 10),
>>>>>>> 4c718f3 (Revert to the old main)
            DropdownMenu<BreadType>(
              textStyle: normalText,
              initialSelection: _selectedBreadType,
              onSelected: _onBreadTypeSelected,
              dropdownMenuEntries: _buildDropdownEntries(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                key: const Key('notes_textfield'),
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (e.g., no onions)',
                ),
              ),
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Quantity: ', style: normalText),
                IconButton(
                  onPressed:
                      _quantity > 0 ? () => setState(() => _quantity--) : null,
                  icon: const Icon(Icons.remove),
                ),
=======

=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
              ),
            ),
            const SizedBox(height: 20),
            DropdownMenu<SandwichType>(
              width: double.infinity,
              label: const Text('Sandwich Type'),
              textStyle: normalText,
              initialSelection: _selectedSandwichType,
              onSelected: (SandwichType? value) {
                if (value != null) {
                  setState(() => _selectedSandwichType = value);
                }
              },
              dropdownMenuEntries: _buildSandwichTypeEntries(),
            ),
            const SizedBox(height: 20),
>>>>>>> 06067ae (Simplify main)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Six-inch', style: normalText),
                Switch(
                  value: _isFootlong,
                  onChanged: (value) => setState(() => _isFootlong = value),
                ),
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
                const Text('Footlong', style: normalText),
              ],
            ),
            const SizedBox(height: 20),
            DropdownMenu<BreadType>(
              width: double.infinity,
              label: const Text('Bread Type'),
              textStyle: normalText,
              initialSelection: _selectedBreadType,
              onSelected: (BreadType? value) {
                if (value != null) {
                  setState(() => _selectedBreadType = value);
                }
              },
              dropdownMenuEntries: _buildBreadTypeEntries(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Quantity: ', style: normalText),
                IconButton(
                  onPressed:
                      _quantity > 0 ? () => setState(() => _quantity--) : null,
                  icon: const Icon(Icons.remove),
                ),
>>>>>>> 06067ae (Simplify main)
                Text('$_quantity', style: heading2),
                IconButton(
                  onPressed: () => setState(() => _quantity++),
                  icon: const Icon(Icons.add),
<<<<<<< HEAD
                ),
              ],
            ),
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

            const SizedBox(height: 20),

=======
            const SizedBox(height: 20),
>>>>>>> 06067ae (Simplify main)
=======

            const SizedBox(height: 20),

>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
            StyledButton(
              onPressed: _getAddToCartCallback(),
              icon: Icons.add_shopping_cart,
              label: 'Add to Cart',
              backgroundColor: Colors.green,
            ),
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)

            const SizedBox(height: 20),

            // Simple cart display
            Text(
              'Cart has ${_cart.length} item(s)',
              style: normalText,
              textAlign: TextAlign.center,
            ),
<<<<<<< HEAD
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
>>>>>>> 4c718f3 (Revert to the old main)
=======
            const SizedBox(height: 20),
>>>>>>> 06067ae (Simplify main)
=======
>>>>>>> 9b1ece5 (Update main.dart based on worksheet 5)
=======
                const SizedBox(width: 8),
                StyledButton(
                  onPressed: _getDecreaseCallback(),
                  icon: Icons.remove,
                  label: 'Remove',
                  backgroundColor: Colors.red,
                ),
              ],
            ),
>>>>>>> 4c718f3 (Revert to the old main)
=======
                ),
              ],
            ),
            const SizedBox(height: 20),
            StyledButton(
              onPressed: _getAddToCartCallback(),
              icon: Icons.add_shopping_cart,
              label: 'Add to Cart',
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 20),
>>>>>>> 06067ae (Simplify main)
          ],
=======
          children: <Widget>[selectMenuButton, buildOwnButton],
>>>>>>> 5494510 (📝 Remove SizeBox (space) between children widget list in LandingPage layout)
=======
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset(
                  _getCurrentImagePath(),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not found',
                        style: normalText,
                      ),
                    );
                  },
                ),
              ),
=======
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 400,
                child: Image.asset(
                  _getCurrentImagePath(),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text(
                        'Image not found',
                        style: normalText,
                      ),
                    );
                  },
                ),
              ),
>>>>>>> 50c98de (Add a SingleChildScrollView to the column)
              const SizedBox(height: 20),
              DropdownMenu<SandwichType>(
                width: double.infinity,
                label: const Text('Sandwich Type'),
                textStyle: normalText,
                initialSelection: _selectedSandwichType,
                onSelected: (SandwichType? value) {
                  if (value != null) {
                    setState(() => _selectedSandwichType = value);
                  }
                },
                dropdownMenuEntries: _buildSandwichTypeEntries(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Six-inch', style: normalText),
                  Switch(
                    value: _isFootlong,
                    onChanged: (value) => setState(() => _isFootlong = value),
                  ),
                  const Text('Footlong', style: normalText),
                ],
              ),
              const SizedBox(height: 20),
              DropdownMenu<BreadType>(
                width: double.infinity,
                label: const Text('Bread Type'),
                textStyle: normalText,
                initialSelection: _selectedBreadType,
                onSelected: (BreadType? value) {
                  if (value != null) {
                    setState(() => _selectedBreadType = value);
                  }
                },
                dropdownMenuEntries: _buildBreadTypeEntries(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Quantity: ', style: normalText),
                  IconButton(
                    onPressed: _quantity > 0
                        ? () => setState(() => _quantity--)
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$_quantity', style: heading2),
                  IconButton(
                    onPressed: () => setState(() => _quantity++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _getAddToCartCallback(),
                icon: Icons.add_shopping_cart,
                label: 'Add to Cart',
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 20),
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 948df75 (Add summary text)
              Text(
                'Cart: ${_cart.countOfItems} items - £${_cart.totalPrice.toStringAsFixed(2)}',
                style: normalText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
<<<<<<< HEAD
            ],
          ),
>>>>>>> 50c98de (Add a SingleChildScrollView to the column)
=======
            ],
          ),
>>>>>>> 50c98de (Add a SingleChildScrollView to the column)
        ),
      ),
    );
<<<<<<< HEAD
  }
}

<<<<<<< HEAD
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;
  const OrderItemDisplay(this.quantity, this.itemType, {super.key});
=======
class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final IconData icon;

  final String label;

  final Color backgroundColor;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });
>>>>>>> e6df372 (Fix all errors regarding missing methods and variables)

  @override
  Widget build(BuildContext context) {
    ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: normalText,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class OrderItemDisplay extends StatelessWidget {
  final int quantity;

  final String itemType;

  final BreadType breadType;

  final String orderNote;

  const OrderItemDisplay({
    super.key,
    required this.quantity,
    required this.itemType,
    required this.breadType,
    required this.orderNote,
  });

  @override
  Widget build(BuildContext context) {
    String displayText =
        '$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}';

    return Column(
      children: [
        Text(
          displayText,
          style: normalText,
        ),
        const SizedBox(height: 8),
        Text(
          'Note: $orderNote',
          style: normalText,
        ),
      ],
    );
=======

    return page;
>>>>>>> 816cadc (first commit)
=======
    return MaterialApp(
=======
    return const MaterialApp(
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
=======
    return MaterialApp(
>>>>>>> f6e2dda (Build UI for OrderScreen)
=======
    return const MaterialApp(
>>>>>>> de43565 (Revert back to original code)
=======
    return MaterialApp(
>>>>>>> 46dcf48 (Update about screen & main to work together)
      title: 'Sandwich Shop App',
      initialRoute: '/',
      routes: {
        '/': (context) => const OrderScreen(maxQuantity: 5),
        '/about': (context) => const AboutScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
<<<<<<< HEAD
  final Cart _cart = Cart();
  final TextEditingController _notesController = TextEditingController();
=======
  int _quantity = 0;
  bool _isFootlong = true;
  BreadType _selectedBreadType = BreadType.white;
>>>>>>> 91c686f (Implement the dropdown and the bread size option)

  SandwichType _selectedSandwichType = SandwichType.veggieDelight;
  bool _isFootlong = true;
  BreadType _selectedBreadType = BreadType.white;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _notesController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _addToCart() {
    if (_quantity > 0) {
      final Sandwich sandwich = Sandwich(
        type: _selectedSandwichType,
        isFootlong: _isFootlong,
        breadType: _selectedBreadType,
      );

      setState(() {
        _cart.addItem(sandwich, quantity: _quantity);
      });

      String sizeText = _isFootlong ? 'footlong' : 'six-inch';
      String confirmationMessage =
          'Added $_quantity $sizeText ${sandwich.name} sandwich(es) on ${_selectedBreadType.name} bread to cart';

      // Show confirmation SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(confirmationMessage),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  VoidCallback? _getAddToCartCallback() {
    if (_quantity > 0) {
      return _addToCart;
    }
    return null;
  }

  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    List<DropdownMenuEntry<SandwichType>> entries = [];
    for (SandwichType type in SandwichType.values) {
      Sandwich sandwich =
          Sandwich(type: type, isFootlong: true, breadType: BreadType.white);
      DropdownMenuEntry<SandwichType> entry = DropdownMenuEntry<SandwichType>(
        value: type,
        label: sandwich.name,
      );
      entries.add(entry);
    }
    return entries;
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadTypeEntries() {
    List<DropdownMenuEntry<BreadType>> entries = [];
    for (BreadType bread in BreadType.values) {
      DropdownMenuEntry<BreadType> entry = DropdownMenuEntry<BreadType>(
        value: bread,
        label: bread.name,
      );
      entries.add(entry);
    }
    return entries;
  }

  String _getCurrentImagePath() {
    final Sandwich sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );
    return sandwich.image;
  }

  void _onSandwichTypeChanged(SandwichType? value) {
    if (value != null) {
      setState(() {
        _selectedSandwichType = value;
      });
    }
  }

  void _onSizeChanged(bool value) {
    setState(() {
      _isFootlong = value;
    });
  }

  void _onBreadTypeChanged(BreadType? value) {
    if (value != null) {
      setState(() {
        _selectedBreadType = value;
      });
    }
  }

  void _increaseQuantity() {
    setState(() {
      if (_quantity < widget.maxQuantity) {
        _quantity++;
      }
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  VoidCallback? _getDecreaseCallback() {
    if (_quantity > 1) {
      return _decreaseQuantity;
    }
    return null;
  }

  int _getCartItemCount() {
    return _cart.totalItems;
  }

  double _getCartTotalPrice() {
    // Calculate total price based on items in the cart
    double total = 0.0;
    for (final item in _cart.items) {
      // Example pricing: $5 for six-inch, $8 for footlong
      double price = item.sandwich.isFootlong ? 8.0 : 5.0;
      total += price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    String sandwichType = 'footlong';
    if (!_isFootlong) {
      sandwichType = 'six-inch';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich Counter',
          style: heading1,
        ),
      ),
      body: Center(
<<<<<<< HEAD
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Cart Summary Widget ---
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Card(
                  color: Colors.yellow[100],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cart: ${_getCartItemCount()} item(s)',
                          style: heading2,
                        ),
                        Text(
                          'Total: \$${_getCartTotalPrice().toStringAsFixed(2)}',
                          style: heading2,
                        ),
                      ],
                    ),
                  ),
=======
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _quantity,
              itemType: sandwichType,
              breadType: _selectedBreadType,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('six-inch', style: normalText),
                Switch(
                  value: _isFootlong,
                  onChanged: (bool value) {
                    setState(() {
                      _isFootlong = value;
                    });
                  },
                ),
                const Text('footlong', style: normalText),
              ],
            ),
            const SizedBox(height: 10),
            DropdownMenu<BreadType>(
              initialSelection: _selectedBreadType,
              onSelected: (BreadType? value) {
                if (value != null) {
                  setState(() {
                    _selectedBreadType = value;
                  });
                }
              },
              dropdownMenuEntries:
                  BreadType.values.map<DropdownMenuEntry<BreadType>>(
                (BreadType bread) {
                  return DropdownMenuEntry<BreadType>(
                      value: bread, label: bread.name);
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton(
                  onPressed: _getIncreaseCallback(),
                  icon: Icons.add,
                  label: 'Add',
                  backgroundColor: Colors.green,
>>>>>>> 91c686f (Implement the dropdown and the bread size option)
                ),
              ),
              // --- End Cart Summary Widget ---
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 250,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    _getCurrentImagePath(),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text(
                          'Image not found',
                          style: normalText,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownMenu<SandwichType>(
                width: double.infinity,
                label: const Text('Sandwich Type'),
                textStyle: normalText,
                initialSelection: _selectedSandwichType,
                onSelected: _onSandwichTypeChanged,
                dropdownMenuEntries: _buildSandwichTypeEntries(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Six-inch', style: normalText),
                  Switch(
                    value: _isFootlong,
                    onChanged: _onSizeChanged,
                  ),
                  const Text('Footlong', style: normalText),
                ],
              ),
              const SizedBox(height: 20),
              DropdownMenu<BreadType>(
                width: double.infinity,
                label: const Text('Bread Type'),
                textStyle: normalText,
                initialSelection: _selectedBreadType,
                onSelected: _onBreadTypeChanged,
                dropdownMenuEntries: _buildBreadTypeEntries(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Quantity: ', style: normalText),
                  IconButton(
                    onPressed: _getDecreaseCallback(),
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$_quantity', style: heading2),
                  IconButton(
                    onPressed: _increaseQuantity,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _getAddToCartCallback(),
                icon: Icons.add_shopping_cart,
                label: 'Add to Cart',
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 20),
=======
>>>>>>> 948df75 (Add summary text)
            ],
          ),
        ),
      ),
    );
>>>>>>> 8235667 (Create a Stateless only app for stage 1)
  }
}

class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final IconData icon;

  final String label;

  final Color backgroundColor;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: normalText,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
<<<<<<< HEAD

class OrderItemDisplay extends StatelessWidget {
  final int quantity;

  final String itemType;

  final BreadType breadType;

  final String orderNote;

  const OrderItemDisplay({
    super.key,
    required this.quantity,
    required this.itemType,
    required this.breadType,
    required this.orderNote,
  });

  @override
  Widget build(BuildContext context) {
    String displayText =
        '$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}';

    return Column(
      children: [
        Text(
          displayText,
          style: normalText,
        ),
        const SizedBox(height: 8),
        Text(
          'Note: $orderNote',
          style: normalText,
        ),
      ],
    );
=======
        padding: const EdgeInsets.all(24),
        child: Column(
<<<<<<< HEAD
          mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
          children: <Widget>[
=======
        padding: const EdgeInsets.all(24),
        child: Column(
<<<<<<< HEAD
          mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
          children: [
>>>>>>> 816cadc (first commit)
=======
          children: <Widget>[
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
=======
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< HEAD
          children: [
>>>>>>> 816cadc (first commit)
=======
          children: <Widget>[
>>>>>>> bfb9ecd (📝 Refactor comments and improve code clarity in main.dart)
            selectMenuButton,
            const SizedBox(height: 16),
            buildOwnButton,
          ],
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
          mainAxisAlignment: MainAxisAlignment.end,
>>>>>>> d21bb71 (📝 Update main.dart to change mainAxisAlignment in LandingPage layout from center to end)
=======
          mainAxisAlignment: MainAxisAlignment.end,
>>>>>>> d21bb71 (📝 Update main.dart to change mainAxisAlignment in LandingPage layout from center to end)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[selectMenuButton, buildOwnButton],
>>>>>>> 5494510 (📝 Remove SizeBox (space) between children widget list in LandingPage layout)
=======
>>>>>>> 816cadc (first commit)
=======
          children: <Widget>[selectMenuButton, buildOwnButton],
>>>>>>> 5494510 (📝 Remove SizeBox (space) between children widget list in LandingPage layout)
=======
>>>>>>> 816cadc (first commit)
        ),
      ),
    );

    return page;
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 816cadc (first commit)
=======
    return MaterialApp(
=======
    return const MaterialApp(
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
=======
    return MaterialApp(
>>>>>>> f6e2dda (Build UI for OrderScreen)
=======
    return const MaterialApp(
>>>>>>> de43565 (Revert back to original code)
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
=======
    return MaterialApp(
=======
    return const MaterialApp(
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
=======
    return MaterialApp(
>>>>>>> f6e2dda (Build UI for OrderScreen)
=======
    return const MaterialApp(
>>>>>>> de43565 (Revert back to original code)
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
=======
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Cart();
      },
      child: const MaterialApp(
        title: 'Sandwich Shop App',
        debugShowCheckedModeBanner: false,
        home: OrderScreen(maxQuantity: 5),
      ),
>>>>>>> 2a7f09c (added provider package, updated cart.dart & main.dart)
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity = _quantity + 1;
      });
    }
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity = _quantity - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich Counter',
          style: Heading1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              'Footlong',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
>>>>>>> 8235667 (Create a Stateless only app for stage 1)
  }
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  bool _isFootlong = true;
  BreadType _selectedBreadType = BreadType.white;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity = _quantity + 1;
      });
    }
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 0) {
        _quantity = _quantity - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String sandwichType = 'footlong';
    if (!_isFootlong) {
      sandwichType = 'six-inch';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich Counter',
          style: Heading1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _quantity,
              itemType: sandwichType,
              breadType: _selectedBreadType,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('six-inch', style: normalText),
                Switch(
                  value: _isFootlong,
                  onChanged: (bool value) {
                    setState(() {
                      _isFootlong = value;
                    });
                  },
                ),
                const Text('footlong', style: normalText),
              ],
            ),
            const SizedBox(height: 10),
            DropdownMenu<BreadType>(
              initialSelection: _selectedBreadType,
              onSelected: (BreadType? value) {
                if (value != null) {
                  setState(() {
                    _selectedBreadType = value;
                  });
                }
              },
              dropdownMenuEntries:
                  BreadType.values.map<DropdownMenuEntry<BreadType>>(
                (BreadType bread) {
                  return DropdownMenuEntry<BreadType>(
                      value: bread, label: bread.name);
                },
              ).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
<<<<<<< HEAD
>>>>>>> 8235667 (Create a Stateless only app for stage 1)
=======
  }
}

class StyledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color backgroundColor;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.backgroundColor,
=======
// A separate, reusable StatelessWidget for displaying the count. It is
// self-contained and only responsible for presentation.
=======
// The StatelessWidget for displaying the count, now with emojis.
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
class SandwichCounter extends StatelessWidget {
  final String sandwichType;
  final int count;

  const SandwichCounter({
    required this.count,
    required this.sandwichType,
    super.key,
>>>>>>> e4280a5 (Draft of code for branch 3)
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 115f280 (Separate styles to app_styles)
    ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: normalText,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            label,
            style: normalText,
          ),
        ],
      ),
    );
>>>>>>> 115f280 (Separate styles to app_styles)
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
<<<<<<< HEAD
<<<<<<< HEAD
  final int quantity;
=======
  final BreadType breadType;
>>>>>>> 91c686f (Implement the dropdown and the bread size option)

  const OrderItemDisplay({
    super.key,
    required this.quantity,
    required this.itemType,
    required this.breadType,
  });

  @override
  Widget build(BuildContext context) {
    String displayText =
        '$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}';

    return Text(
      displayText,
      style: normalText,
    );
  }
}
=======
>>>>>>> ef463b3 (Remove OrderItemDisplay)
=======
>>>>>>> 6ba2694 (Move order screen to its own view)
=======
  }
}
>>>>>>> 816cadc (first commit)
=======
=======
    // The text now includes the sandwich emoji repeated for the current count.
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
    return Text(
      '$count $sandwichType sandwich(es): ${'🥪' * count}',
      style: const TextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
=======
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;
=======
  final BreadType breadType;
>>>>>>> 91c686f (Implement the dropdown and the bread size option)

  const OrderItemDisplay({
    super.key,
    required this.quantity,
    required this.itemType,
    required this.breadType,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
>>>>>>> 4cfe3e7 (Simplified code for worksheet 3)
=======
=======
    String displayText =
        '$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}';

>>>>>>> 91c686f (Implement the dropdown and the bread size option)
    return Text(
      displayText,
      style: normalText,
    );
>>>>>>> 115f280 (Separate styles to app_styles)
  }
}
>>>>>>> e4280a5 (Draft of code for branch 3)
=======
>>>>>>> ef463b3 (Remove OrderItemDisplay)
=======
>>>>>>> 6ba2694 (Move order screen to its own view)
=======
  }
}
>>>>>>> 816cadc (first commit)
