import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';
import 'package:sandwich_shop/views/settings_screen.dart';
import 'package:sandwich_shop/views/common_widgets.dart';

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _notesController = TextEditingController();

  SandwichType _selectedSandwichType = SandwichType.veggieDelight;
  bool _isFootlong = true;
  BreadType _selectedBreadType = BreadType.white;
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _notesController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SettingsScreen()),
    );
  }

  Future<void> _navigateToProfile() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );

    if (result != null && mounted) {
      final name = result['name']!;
      final location = result['location']!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome, $name! Ordering from $location')),
      );
    }
  }

  void _addToCart() {
    if (_quantity <= 0) return;

    final cart = Provider.of<Cart>(context, listen: false);

    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );

    cart.addItem(sandwich, quantity: _quantity);

    final sizeText = _isFootlong ? 'footlong' : 'six-inch';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added $_quantity $sizeText ${sandwich.name} sandwich(es) '
          'on ${_selectedBreadType.name} bread to cart',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  VoidCallback? _getAddToCartCallback() => _quantity > 0 ? _addToCart : null;

  void _navigateToCartView() {
    final cart = Provider.of<Cart>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartScreen(cart: cart)),
    );
  }

  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    return SandwichType.values.map((type) {
      final sandwich = Sandwich(
        type: type,
        isFootlong: true,
        breadType: BreadType.white,
      );
      return DropdownMenuEntry(
        value: type,
        label: sandwich.name,
      );
    }).toList();
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadTypeEntries() {
    return BreadType.values
        .map((bread) => DropdownMenuEntry(value: bread, label: bread.name))
        .toList();
  }

  String _getCurrentImagePath() {
    return Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    ).image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: Text('Sandwich Counter', style: heading1),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, __) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.shopping_cart),
                  const SizedBox(width: 4),
                  Text('${cart.itemCount}'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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

              // Sandwich Type
              DropdownMenu<SandwichType>(
                width: double.infinity,
                label: const Text('Sandwich Type'),
                textStyle: normalText,
                initialSelection: _selectedSandwichType,
                dropdownMenuEntries: _buildSandwichTypeEntries(),
                onSelected: (value) =>
                    setState(() => _selectedSandwichType = value!),
              ),

              const SizedBox(height: 20),

              // Size Switch
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

              // Bread Type
              DropdownMenu<BreadType>(
                width: double.infinity,
                label: const Text('Bread Type'),
                textStyle: normalText,
                initialSelection: _selectedBreadType,
                dropdownMenuEntries: _buildBreadTypeEntries(),
                onSelected: (value) =>
                    setState(() => _selectedBreadType = value!),
              ),

              const SizedBox(height: 20),

              // Quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quantity: ', style: normalText),
                  IconButton(
                    onPressed: _quantity > 0
                        ? () => setState(() => _quantity--)
                        : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Text('$_quantity', style: heading2),
                  IconButton(
                    onPressed: _quantity < widget.maxQuantity
                        ? () => setState(() => _quantity++)
                        : null,
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

              StyledButton(
                onPressed: _navigateToCartView,
                icon: Icons.shopping_cart,
                label: 'View Cart',
                backgroundColor: Colors.blue,
              ),

              const SizedBox(height: 20),

              StyledButton(
                onPressed: _navigateToProfile,
                icon: Icons.person,
                label: 'Profile',
                backgroundColor: Colors.purple,
              ),

              const SizedBox(height: 20),

              StyledButton(
                onPressed: _navigateToSettings,
                icon: Icons.settings,
                label: 'Settings',
                backgroundColor: Colors.grey,
              ),

              const SizedBox(height: 20),

              Consumer<Cart>(
                builder: (_, cart, __) => Text(
                  'Cart: ${cart.itemCount} items - £${cart.totalPrice.toStringAsFixed(2)}',
                  style: normalText,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
