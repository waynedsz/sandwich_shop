import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // -------------------------------
  // Helpers
  // -------------------------------
  String _getSizeText(bool isFootlong) => isFootlong ? "Footlong" : "Six-inch";

  double _getItemPrice(Sandwich sandwich, int qty) {
    return PricingRepository(quantity: qty, isFootlong: sandwich.isFootlong)
        .getTotalPrice();
  }

  // -------------------------------
  // Quantity Actions
  // -------------------------------
  void _incrementQuantity(Sandwich sandwich) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.incrementQuantity(sandwich);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quantity increased')),
    );
  }

  void _decrementQuantity(Sandwich sandwich) {
    final cart = Provider.of<Cart>(context, listen: false);
    final wasPresent = cart.items.containsKey(sandwich);
    cart.decrementQuantity(sandwich);
    if (!cart.items.containsKey(sandwich) && wasPresent) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item removed from cart')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quantity decreased')),
      );
    }
  }

  void _removeItem(Sandwich sandwich) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.removeAllOf(sandwich);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from cart')),
    );
  }

  // -------------------------------
  // Navigation to Checkout
  // -------------------------------
  Future<void> _navigateToCheckout() async {
    final cart = Provider.of<Cart>(context, listen: false);

    if (cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Your cart is empty")),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CheckoutScreen()),
    );

    if (result != null && mounted) {
      cart.clear();

      final orderId = result['orderId'] as String;
      final eta = result['estimatedTime'] as String;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Order $orderId confirmed! ETA: $eta"),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 4),
        ),
      );

      Navigator.pop(context);
    }
  }

  // -------------------------------
  // UI
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Cart"),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),

                  // Empty cart message
                  if (cart.items.isEmpty)
                    Text(
                      "Your cart is empty.",
                      style: heading2,
                      textAlign: TextAlign.center,
                    )
                  else
                    for (final entry in cart.items.entries)
                      Column(
                        children: [
                          Text(entry.key.name, style: heading2),
                          Text(
                            '${_getSizeText(entry.key.isFootlong)} on ${entry.key.breadType.name} bread',
                            style: normalText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decrementQuantity(entry.key),
                              ),
                              Text(
                                'Qty: ${entry.value}',
                                style: normalText,
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _incrementQuantity(entry.key),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '£${_getItemPrice(entry.key, entry.value).toStringAsFixed(2)}',
                                style: normalText,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _removeItem(entry.key),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),

                  // Total price
                  Text(
                    'Total: £${cart.totalPrice.toStringAsFixed(2)}',
                    style: heading2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Checkout button
                  if (cart.items.isNotEmpty)
                    StyledButton(
                      onPressed: _navigateToCheckout,
                      label: "Checkout",
                      icon: Icons.payment,
                      backgroundColor: Colors.orange,
                    ),

                  const SizedBox(height: 20),

                  // Back button
                  StyledButton(
                    onPressed: () => Navigator.pop(context),
                    label: "Back to Order",
                    icon: Icons.arrow_back,
                    backgroundColor: Colors.grey,
                  ),

                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
