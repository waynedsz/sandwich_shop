import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      debugShowCheckedModeBanner: false,
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final Cart _cart = Cart();
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

  void _addToCart() {
    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );

    _cart.addItem(sandwich, quantity: _quantity);

    final sizeText = _isFootlong ? 'footlong' : 'six-inch';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Added $_quantity $sizeText ${sandwich.name} sandwich(es)'
          ' on ${_selectedBreadType.name} bread to cart',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  VoidCallback? _getAddToCartCallback() {
    return _quantity > 0 ? _addToCart : null;
  }

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  int _getCartItemCount() => _cart.totalItems;

  double _getCartTotalPrice() {
    double total = 0.0;

    for (final item in _cart.items) {
      final price = item.sandwich.isFootlong ? 8.0 : 5.0;
      total += price * item.quantity;
    }

    return total;
  }

  String _currentSandwichImage() {
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
        title: const Text('Sandwich Counter', style: heading1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- Cart Summary ---
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.yellow[100],
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cart: ${_getCartItemCount()} item(s)',
                            style: heading2),
                        Text(
                            'Total: \$${_getCartTotalPrice().toStringAsFixed(2)}',
                            style: heading2),
                      ],
                    ),
                  ),
                ),
              ),

              // --- Sandwich Image ---
              SizedBox(
                height: 250,
                child: Image.asset(
                  _currentSandwichImage(),
                  errorBuilder: (_, __, ___) =>
                      const Text('Image not found', style: normalText),
                ),
              ),

              const SizedBox(height: 20),

              // --- Sandwich Type Dropdown ---
              DropdownMenu<SandwichType>(
                initialSelection: _selectedSandwichType,
                onSelected: (val) =>
                    setState(() => _selectedSandwichType = val!),
                dropdownMenuEntries: SandwichType.values
                    .map(
                      (t) => DropdownMenuEntry(
                        value: t,
                        label: Sandwich(
                                type: t,
                                isFootlong: true,
                                breadType: BreadType.white)
                            .name,
                      ),
                    )
                    .toList(),
                label: const Text('Sandwich Type'),
                textStyle: normalText,
                width: 280,
              ),

              const SizedBox(height: 20),

              // --- Size Switch ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Six-inch', style: normalText),
                  Switch(
                    value: _isFootlong,
                    onChanged: (v) => setState(() => _isFootlong = v),
                  ),
                  const Text('Footlong', style: normalText),
                ],
              ),

              const SizedBox(height: 20),

              // --- Bread Dropdown ---
              DropdownMenu<BreadType>(
                initialSelection: _selectedBreadType,
                onSelected: (val) => setState(() => _selectedBreadType = val!),
                dropdownMenuEntries: BreadType.values
                    .map((b) => DropdownMenuEntry(value: b, label: b.name))
                    .toList(),
                textStyle: normalText,
                label: const Text('Bread Type'),
                width: 280,
              ),

              const SizedBox(height: 20),

              // --- Quantity Selector ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _quantity > 1 ? _decreaseQuantity : null,
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

              // --- Add to Cart ---
              StyledButton(
                onPressed: _getAddToCartCallback(),
                icon: Icons.add_shopping_cart,
                label: 'Add to Cart',
                backgroundColor: Colors.green,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        textStyle: normalText,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
    final display =
        "$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}";

    return Column(
      children: [
        Text(display, style: normalText),
        const SizedBox(height: 8),
        Text("Note: $orderNote", style: normalText),
      ],
    );
  }
}
