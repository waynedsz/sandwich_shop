import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';
import 'package:sandwich_shop/views/common_widgets.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String _getSizeText(bool isFootlong) => isFootlong ? 'Footlong' : 'Six-inch';

  double _getItemPrice(Sandwich sandwich, int quantity) {
    final pricingRepo =
        PricingRepository(quantity: quantity, isFootlong: sandwich.isFootlong);
    return pricingRepo.getTotalPrice();
  }

  void _navigateToCheckout() {
    if (widget.cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Your cart is empty')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CheckoutScreen(cart: widget.cart),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: Text("Cart View", style: heading1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              if (cart.items.isEmpty)
                Text("Your cart is empty.",
                    style: heading2, textAlign: TextAlign.center),
              if (cart.items.isNotEmpty)
                for (final entry in cart.items.entries)
                  Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry.key.name, style: heading2),
                                Text(
                                  '${_getSizeText(entry.key.isFootlong)} on ${entry.key.breadType.name} bread',
                                  style: normalText,
                                ),
                                Text(
                                  '£${_getItemPrice(entry.key, entry.value).toStringAsFixed(2)}',
                                  style: normalText,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() => cart.decrementQuantity(entry.key));
                            },
                          ),
                          Text('${entry.value}', style: heading2),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() => cart.incrementQuantity(entry.key));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() => cart.removeItem(entry.key));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
              const SizedBox(height: 20),
              Text(
                'Total: £${cart.totalPrice.toStringAsFixed(2)}',
                style: heading2,
              ),
              const SizedBox(height: 20),
              if (cart.items.isNotEmpty)
                StyledButton(
                  onPressed: _navigateToCheckout,
                  icon: Icons.payment,
                  label: 'Checkout',
                  backgroundColor: Colors.orange,
                ),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: () => Navigator.pop(context),
                icon: Icons.arrow_back,
                label: 'Back to Order',
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
