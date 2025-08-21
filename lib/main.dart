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
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    ThemeData theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    MaterialApp application = MaterialApp(
      title: 'Sandwich Shop',
      theme: theme,
      home: LandingPage(),
    );

    return application;
  }
}

/// First screen that offers the main user actions.
///
/// A [StatefulWidget] is used so callback methods can access
/// [BuildContext] directly.
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  /// Shows a generic *feature coming soon* [SnackBar].
  void _showNotImplemented() {
    ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    SnackBar bar = SnackBar(content: Text('Feature coming soon…'));
    messenger.showSnackBar(bar);
  }

  /// Handles presses on *Select from the menu*.
  void _handleSelectMenuPressed() {
    _showNotImplemented();
  }

  /// Handles presses on *Build your own sandwich*.
  void _handleBuildOwnPressed() {
    _showNotImplemented();
  }

  /// Handles the *Account* menu item.
  void _handleAccountAction() {
    _showNotImplemented();
  }

  /// Handles the *Orders* menu item.
  void _handleOrdersAction() {
    _showNotImplemented();
  }

  /// Handles the *Log out* menu item.
  void _handleLogoutAction() {
    _showNotImplemented();
  }

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
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
<<<<<<< HEAD
          children: <Widget>[
            selectMenuButton,
            const SizedBox(height: 16),
            buildOwnButton,
>>>>>>> 816cadc (first commit)
          ],
=======
          children: <Widget>[selectMenuButton, buildOwnButton],
>>>>>>> 5494510 (📝 Remove SizeBox (space) between children widget list in LandingPage layout)
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
=======
    return MaterialApp(
=======
    return const MaterialApp(
>>>>>>> e5a5f0e (📝 Refactor main.dart to improve code clarity and organization)
      title: 'Sandwich Shop App',
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
        title: const Text('Sandwich Counter'),
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

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}
