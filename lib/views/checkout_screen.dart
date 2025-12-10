import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isProcessing = false;

  double _calculateItemPrice(Sandwich sandwich, int quantity) {
    return PricingRepository().calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  Future<void> _processPayment() async {
    setState(() => _isProcessing = true);

    await Future.delayed(const Duration(seconds: 2));

    // ignore: use_build_context_synchronously
    final cart = Provider.of<Cart>(context, listen: false);

    final String orderId = "ORD${DateTime.now().millisecondsSinceEpoch}";

    final Map<String, dynamic> confirmation = {
      "orderId": orderId,
      "totalAmount": cart.totalPrice,
      "itemCount": cart.itemCount,
      "estimatedTime": "15–20 minutes",
    };

    if (mounted) Navigator.pop(context, confirmation);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: Text("Checkout", style: heading1),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart),
                const SizedBox(width: 4),
                Text('${cart.itemCount}'),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Order Summary", style: heading2),
            const SizedBox(height: 20),

            // List each item
            for (final entry in cart.items.entries) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${entry.value}× ${entry.key.name}", style: normalText),
                  Text(
                    "£${_calculateItemPrice(entry.key, entry.value).toStringAsFixed(2)}",
                    style: normalText,
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],

            const Divider(),
            const SizedBox(height: 10),

            // Total row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:", style: heading2),
                Text(
                  "£${cart.totalPrice.toStringAsFixed(2)}",
                  style: heading2,
                ),
              ],
            ),

            const SizedBox(height: 40),
            Text(
              "Payment Method: Card ending in 1234",
              style: normalText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Payment button OR processing spinner
            if (_isProcessing)
              Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    "Processing payment...",
                    style: normalText,
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text("Confirm Payment", style: normalText),
              ),
          ],
        ),
      ),
    );
  }
}
