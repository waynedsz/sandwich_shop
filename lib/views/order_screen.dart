import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';
import 'package:sandwich_shop/views/settings_screen.dart';
import 'package:sandwich_shop/views/order_history_screen.dart';

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  SandwichType _selectedSandwichType = SandwichType.veggieDelight;
  BreadType _selectedBreadType = BreadType.white;
  bool _isFootlong = true;
  int _quantity = 1;

  // Navigate to SETTINGS
  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  // Navigate to PROFILE
  Future<void> _navigateToProfile() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );

    if (mounted && result != null) {
      final msg =
          'Welcome, ${result["name"]}! Ordering from ${result["location"]}';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), duration: const Duration(seconds: 3)),
      );
    }
  }

  // Navigate to CART
  void _navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartScreen()),
    );
  }

  // Navigate to ORDER HISTORY
  void _navigateToOrderHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OrderHistoryScreen()),
    );
  }

  // Build dropdown entries
  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    return SandwichType.values
        .map(
          (type) => DropdownMenuEntry(
            value: type,
            label: Sandwich(
                    type: type, isFootlong: true, breadType: BreadType.white)
                .name,
          ),
        )
        .toList();
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadTypeEntries() {
    return BreadType.values
        .map(
          (bread) => DropdownMenuEntry(
            value: bread,
            label: bread.name,
          ),
        )
        .toList();
  }

  String _getCurrentImagePath() {
    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );
    return sandwich.image;
  }

  // ADD TO CART
  void _addToCart() {
    final cart = Provider.of<Cart>(context, listen: false);

    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );

    cart.addItem(sandwich, quantity: _quantity);

    final sizeText = _isFootlong ? "footlong" : "six-inch";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Added $_quantity $sizeText ${sandwich.name} on ${_selectedBreadType.name} bread",
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Sandwich Counter',
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 4),
                    Text("${cart.countOfItems}"),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // IMAGE
              SizedBox(
                height: 300,
                child: Image.asset(
                  _getCurrentImagePath(),
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Center(child: Text('Image not found', style: normalText)),
                ),
              ),
              const SizedBox(height: 20),

              // SANDWICH TYPE
              DropdownMenu<SandwichType>(
                width: double.infinity,
                label: const Text('Sandwich Type'),
                initialSelection: _selectedSandwichType,
                textStyle: normalText,
                onSelected: (value) =>
                    setState(() => _selectedSandwichType = value!),
                dropdownMenuEntries: _buildSandwichTypeEntries(),
              ),
              const SizedBox(height: 20),

              // SIZE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Six-inch', style: normalText),
                  Switch(
                    value: _isFootlong,
                    onChanged: (value) => setState(() => _isFootlong = value),
                  ),
                  Text('Footlong', style: normalText),
                ],
              ),
              const SizedBox(height: 20),

              // BREAD TYPE
              DropdownMenu<BreadType>(
                width: double.infinity,
                label: const Text('Bread Type'),
                initialSelection: _selectedBreadType,
                textStyle: normalText,
                onSelected: (value) =>
                    setState(() => _selectedBreadType = value!),
                dropdownMenuEntries: _buildBreadTypeEntries(),
              ),
              const SizedBox(height: 20),

              // QUANTITY
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quantity: ', style: normalText),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _quantity > 1
                        ? () => setState(() => _quantity--)
                        : null,
                  ),
                  Text("$_quantity", style: heading2),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_quantity < widget.maxQuantity) {
                        setState(() => _quantity++);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ADD TO CART
              StyledButton(
                onPressed: _addToCart,
                icon: Icons.add_shopping_cart,
                label: 'Add to Cart',
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 20),

              // VIEW CART
              StyledButton(
                onPressed: _navigateToCart,
                icon: Icons.shopping_cart,
                label: 'View Cart',
                backgroundColor: Colors.blue,
              ),
              const SizedBox(height: 20),

              // PROFILE
              StyledButton(
                onPressed: _navigateToProfile,
                icon: Icons.person,
                label: 'Profile',
                backgroundColor: Colors.purple,
              ),
              const SizedBox(height: 20),

              // SETTINGS
              StyledButton(
                onPressed: _navigateToSettings,
                icon: Icons.settings,
                label: 'Settings',
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 20),

              // ORDER HISTORY
              StyledButton(
                onPressed: _navigateToOrderHistory,
                icon: Icons.history,
                label: 'Order History',
                backgroundColor: Colors.indigo,
              ),
              const SizedBox(height: 20),

              // CART SUMMARY
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return Text(
                    "Cart: ${cart.countOfItems} items - £${cart.totalPrice.toStringAsFixed(2)}",
                    textAlign: TextAlign.center,
                    style: normalText,
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
