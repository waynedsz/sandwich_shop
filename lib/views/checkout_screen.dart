import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';
import 'package:sandwich_shop/services/database_service.dart';
import 'package:sandwich_shop/models/saved_order.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool _isProcessing = false;

  double _calculateItemPrice(Sandwich sandwich, int quantity) {
    return PricingRepository(
            quantity: quantity, isFootlong: sandwich.isFootlong)
        .getTotalPrice();
  }

  Future<void> _processPayment() async {
    final cart = Provider.of<Cart>(context, listen: false);

    if (cart.items.isEmpty) return;

    setState(() => _isProcessing = true);

    await Future.delayed(const Duration(seconds: 2));

    final now = DateTime.now();
    final orderId = "ORD${now.millisecondsSinceEpoch}";

    // Save to local database (Worksheet requirement)
    final savedOrder = SavedOrder(
      id: 0,
      orderId: orderId,
      totalAmount: cart.totalPrice,
      itemCount: cart.countOfItems,
      orderDate: now,
    );

    await DatabaseService().insertOrder(savedOrder);

    // Return values to cart screen
    if (mounted) {
      Navigator.pop(context, {
        'orderId': orderId,
        'totalAmount': cart.totalPrice,
        'itemCount': cart.countOfItems,
        'estimatedTime': '15-20 minutes',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Checkout"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            final List<Widget> columnChildren = [];

            // ORDER SUMMARY TITLE
            columnChildren.add(Text("Order Summary", style: heading2));
            columnChildren.add(const SizedBox(height: 20));

            // ORDER ITEMS
            for (final entry in cart.items.entries) {
              final sandwich = entry.key;
              final quantity = entry.value;
              final itemPrice = _calculateItemPrice(sandwich, quantity);

              columnChildren.add(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${quantity}x ${sandwich.name}", style: normalText),
                    Text("£${itemPrice.toStringAsFixed(2)}", style: normalText),
                  ],
                ),
              );

              columnChildren.add(const SizedBox(height: 8));
            }

            // DIVIDER
            columnChildren.add(const Divider());
            columnChildren.add(const SizedBox(height: 10));

            // TOTAL ROW
            columnChildren.add(
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
            );

            columnChildren.add(const SizedBox(height: 40));

            // PAYMENT METHOD
            columnChildren.add(
              Text(
                "Payment Method: Card ending in 1234",
                style: normalText,
                textAlign: TextAlign.center,
              ),
            );

            columnChildren.add(const SizedBox(height: 20));

            // PROCESSING UI
            if (_isProcessing) {
              columnChildren
                  .add(const Center(child: CircularProgressIndicator()));
              columnChildren.add(const SizedBox(height: 20));
              columnChildren.add(
                Text(
                  "Processing payment...",
                  style: normalText,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              // CONFIRM PAYMENT BUTTON
              columnChildren.add(
                ElevatedButton(
                  onPressed: _processPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Confirm Payment", style: normalText),
                ),
              );
            }

            return Column(children: columnChildren);
          },
        ),
      ),
    );
  }
}
