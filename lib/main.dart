import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
import 'package:sandwich_shop/repositories/PricingRepository.dart';
>>>>>>> 70d9ab4 (Added a pricing repository, unit testing for it and display)
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';
>>>>>>> 40459b4 (Added a import to fix errors)

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

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  late final OrderRepository _orderRepository;
  final TextEditingController _notesController = TextEditingController();
  bool _isFootlong = true;
  bool _isToasted = false;
  BreadType _selectedBreadType = BreadType.white;

  @override
  void initState() {
    super.initState();
    _orderRepository = OrderRepository(maxQuantity: widget.maxQuantity);
    _notesController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  VoidCallback? _getIncreaseCallback() {
    if (_orderRepository.canIncrement) {
      return () => setState(_orderRepository.increment);
    }
    return null;
  }

  VoidCallback? _getDecreaseCallback() {
    if (_orderRepository.canDecrement) {
      return () => setState(_orderRepository.decrement);
    }
    return null;
  }

  void _onSandwichTypeChanged(bool value) {
    setState(() => _isFootlong = value);
  }

  void _onBreadTypeSelected(BreadType? value) {
    if (value != null) {
      setState(() => _selectedBreadType = value);
    }
  }

  List<DropdownMenuEntry<BreadType>> _buildDropdownEntries() {
    List<DropdownMenuEntry<BreadType>> entries = [];
    for (BreadType bread in BreadType.values) {
      DropdownMenuEntry<BreadType> newEntry = DropdownMenuEntry<BreadType>(
        value: bread,
        label: bread.name,
      );
      entries.add(newEntry);
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final pricingRepository = PricingRepository(
      quantity: _orderRepository.quantity,
      isFootlong: _isFootlong,
    );
    final totalPrice = pricingRepository.getTotalPrice();
    String sandwichType = 'footlong';
    if (!_isFootlong) {
      sandwichType = 'six-inch';
    }

    String noteForDisplay;
    if (_notesController.text.isEmpty) {
      noteForDisplay = 'No notes added.';
    } else {
      noteForDisplay = _notesController.text;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich Counter',
          style: heading1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              quantity: _orderRepository.quantity,
              itemType: sandwichType,
              breadType: _selectedBreadType,
              orderNote: noteForDisplay,
            ),
            Text(
              'Total Price: £${totalPrice.toStringAsFixed(2)}',
              style: heading1,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('six-inch', style: normalText),
                Switch(
                  key: const Key('sandwichTypeSwitch'),
                  value: _isFootlong,
                  onChanged: _onSandwichTypeChanged,
                ),
                const Text('footlong', style: normalText),
              ],
            ),
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

void main() {
  runApp(const SandwichShopApp());
}

/// Entry‑point widget for the sandwich‑shop application.
class SandwichShopApp extends StatelessWidget {
  const SandwichShopApp({super.key});

  /// Builds the root MaterialApp with a simple green theme and
  /// routes to the LandingPage.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    final MaterialApp application = MaterialApp(
      title: 'Sandwich Shop',
      theme: theme,
      home: const LandingPage(),
    );

    return application;
  }
}

/// First screen that offers the main choices.
///
/// A stateful widget is used so the handlers can access context
/// directly, avoiding anonymous (lambda) functions.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  /// Shows a standard feature‑not‑implemented SnackBar.
  void _showNotImplemented() {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    final SnackBar bar = SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

  /// Called when "Select from the menu" is pressed.
  void _handleSelectMenuPressed() {
    _showNotImplemented();
  }

  /// Called when "Build your own sandwich" is pressed.
  void _handleBuildOwnPressed() {
    _showNotImplemented();
  }

  /// Responds to the "Account" menu item.
  void _handleAccountAction() {
    _showNotImplemented();
  }

  /// Responds to the "Orders" menu item.
  void _handleOrdersAction() {
    _showNotImplemented();
  }

  /// Responds to the "Log out" menu item.
  void _handleLogoutAction() {
    _showNotImplemented();
  }

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

    // Assemble the scaffold.
    final Scaffold page = Scaffold(
      appBar: AppBar(
        title: screenTitle,
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Account menu',
            icon: avatarIcon,
            itemBuilder:
                (BuildContext ctx) => [accountItem, ordersItem, logoutItem],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectMenuButton,
            const SizedBox(height: 16),
            buildOwnButton,
>>>>>>> 816cadc (first commit)
          ],
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
  }
}
