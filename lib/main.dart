import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/views/about_screen.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    if (_quantity <= 0) return;

    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );

    setState(() {
      _cart.addItem(sandwich, quantity: _quantity);
    });

    final size = _isFootlong ? "footlong" : "six-inch";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Added $_quantity $size ${sandwich.name} sandwich(es) on ${_selectedBreadType.name} bread",
        ),
        duration: const Duration(seconds: 2),
      ),
    );
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

  List<DropdownMenuEntry<SandwichType>> _buildSandwichTypeEntries() {
    return SandwichType.values.map((type) {
      return DropdownMenuEntry(
        value: type,
        label: Sandwich(
          type: type,
          isFootlong: true,
          breadType: BreadType.white,
        ).name,
      );
    }).toList();
  }

  List<DropdownMenuEntry<BreadType>> _buildBreadEntries() {
    return BreadType.values.map((bread) {
      return DropdownMenuEntry(value: bread, label: bread.name);
    }).toList();
  }

  String _getImagePath() {
    final sandwich = Sandwich(
      type: _selectedSandwichType,
      isFootlong: _isFootlong,
      breadType: _selectedBreadType,
    );
    return sandwich.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sandwich Counter',
          style: heading1,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Cart Summary
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.yellow[100],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cart: ${_cart.totalItems} item(s)",
                            style: heading2),
                        Text(
                          "Total: £${_cart.totalPrice.toStringAsFixed(2)}",
                          style: heading2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Image Display
              SizedBox(
                height: 250,
                child: Image.asset(
                  _getImagePath(),
                  fit: BoxFit.contain,
                  errorBuilder: (context, _, __) => const Center(
                      child: Text("Image not found", style: normalText)),
                ),
              ),

              const SizedBox(height: 20),

              // Sandwich Type Dropdown
              DropdownMenu(
                width: double.infinity,
                label: const Text("Sandwich Type"),
                initialSelection: _selectedSandwichType,
                dropdownMenuEntries: _buildSandwichTypeEntries(),
                onSelected: (value) {
                  if (value != null) {
                    setState(
                        () => _selectedSandwichType = value as SandwichType);
                  }
                },
              ),

              const SizedBox(height: 20),

              // Size Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Six-inch"),
                  Switch(
                    value: _isFootlong,
                    onChanged: (val) => setState(() => _isFootlong = val),
                  ),
                  const Text("Footlong"),
                ],
              ),

              const SizedBox(height: 20),

              // Bread Type Dropdown
              DropdownMenu(
                width: double.infinity,
                label: const Text("Bread Type"),
                initialSelection: _selectedBreadType,
                dropdownMenuEntries: _buildBreadEntries(),
                onSelected: (value) {
                  if (value != null) {
                    setState(() => _selectedBreadType = value as BreadType);
                  }
                },
              ),

              const SizedBox(height: 20),

              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _quantity > 1 ? _decreaseQuantity : null,
                    icon: const Icon(Icons.remove),
                  ),
                  Text("$_quantity", style: heading2),
                  IconButton(
                    onPressed: _increaseQuantity,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Add to Cart
              StyledButton(
                onPressed: _quantity > 0 ? _addToCart : null,
                icon: Icons.add_shopping_cart,
                label: "Add to Cart",
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
      style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: 6),
          Text(label, style: normalText),
        ],
      ),
    );
  }
}
