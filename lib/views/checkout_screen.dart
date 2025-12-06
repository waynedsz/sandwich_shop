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

  Future<void> _processPayment() async {
    setState(() {
      _isProcessing = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    final DateTime currentTime = DateTime.now();
    final int timestamp = currentTime.millisecondsSinceEpoch;
    final String orderId = 'ORD$timestamp';

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    final Cart cart = Provider.of<Cart>(context, listen: false);
>>>>>>> e1ed5d6 (Updated each screen for preparation)
    final Map orderConfirmation = {
=======
    final Map<String, dynamic> orderConfirmation = {
>>>>>>> 51d5237 (Simplify checkout screen)
=======
    final Map orderConfirmation = {
>>>>>>> 37af532 (Simplify cart and checkout screens)
      'orderId': orderId,
      'totalAmount': cart.totalPrice,
      'itemCount': cart.countOfItems,
      'estimatedTime': '15-20 minutes',
<<<<<<< HEAD
<<<<<<< HEAD
=======
      'status': 'confirmed'
>>>>>>> 51d5237 (Simplify checkout screen)
=======
>>>>>>> c12b154 (Remove order cancellation)
    };

    if (mounted) {
      Navigator.pop(context, orderConfirmation);
    }
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
  void _cancelOrder() {
    final Map<String, String> cancellationData = {'status': 'cancelled'};
    Navigator.pop(context, cancellationData);
  }

>>>>>>> 51d5237 (Simplify checkout screen)
=======
>>>>>>> c12b154 (Remove order cancellation)
  double _calculateItemPrice(Sandwich sandwich, int quantity) {
    PricingRepository repo = PricingRepository();
    return repo.calculatePrice(
        quantity: quantity, isFootlong: sandwich.isFootlong);
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3c9bb58 (Simplify the checkout page)
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    List<Widget> columnChildren = [];

    columnChildren.add(const Text('Order Summary', style: heading2));
    columnChildren.add(const SizedBox(height: 20));
<<<<<<< HEAD
=======
  List<Widget> _buildOrderItems() {
    List<Widget> orderItems = [];
>>>>>>> 51d5237 (Simplify checkout screen)
=======
>>>>>>> 3c9bb58 (Simplify the checkout page)

    for (MapEntry<Sandwich, int> entry in widget.cart.items.entries) {
      final Sandwich sandwich = entry.key;
      final int quantity = entry.value;
      final double itemPrice = _calculateItemPrice(sandwich, quantity);

      final Widget itemRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${quantity}x ${sandwich.name}',
            style: normalText,
          ),
          Text(
            '£${itemPrice.toStringAsFixed(2)}',
            style: normalText,
          ),
        ],
      );

<<<<<<< HEAD
<<<<<<< HEAD
      columnChildren.add(itemRow);
      columnChildren.add(const SizedBox(height: 8));
    }

    columnChildren.add(const Divider());
    columnChildren.add(const SizedBox(height: 10));

    final Widget totalRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total:', style: heading2),
        Text(
          '£${widget.cart.totalPrice.toStringAsFixed(2)}',
          style: heading2,
        ),
      ],
    );
    columnChildren.add(totalRow);
    columnChildren.add(const SizedBox(height: 40));

    columnChildren.add(
      const Text(
        'Payment Method: Card ending in 1234',
        style: normalText,
        textAlign: TextAlign.center,
      ),
    );
    columnChildren.add(const SizedBox(height: 20));

    if (_isProcessing) {
      columnChildren.add(
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
      columnChildren.add(const SizedBox(height: 20));
      columnChildren.add(
=======
      orderItems.add(itemRow);
      orderItems.add(const SizedBox(height: 8));
=======
      columnChildren.add(itemRow);
      columnChildren.add(const SizedBox(height: 8));
>>>>>>> 3c9bb58 (Simplify the checkout page)
    }

    columnChildren.add(const Divider());
    columnChildren.add(const SizedBox(height: 10));

    final Widget totalRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Total:', style: heading2),
        Text(
          '£${widget.cart.totalPrice.toStringAsFixed(2)}',
          style: heading2,
        ),
      ],
    );
    columnChildren.add(totalRow);
    columnChildren.add(const SizedBox(height: 40));

    columnChildren.add(
      const Text(
        'Payment Method: Card ending in 1234',
        style: normalText,
        textAlign: TextAlign.center,
      ),
    );
    columnChildren.add(const SizedBox(height: 20));

    if (_isProcessing) {
      columnChildren.add(
        const Center(
          child: CircularProgressIndicator(),
        ),
<<<<<<< HEAD
        const SizedBox(height: 20),
>>>>>>> 51d5237 (Simplify checkout screen)
=======
      );
      columnChildren.add(const SizedBox(height: 20));
      columnChildren.add(
>>>>>>> 3c9bb58 (Simplify the checkout page)
        const Text(
          'Processing payment...',
          style: normalText,
          textAlign: TextAlign.center,
        ),
<<<<<<< HEAD
<<<<<<< HEAD
      );
    } else {
      columnChildren.add(
        ElevatedButton(
          onPressed: _processPayment,
<<<<<<< HEAD
          child: const Text('Confirm Payment', style: normalText),
        ),
      );
    }
=======
      ];
=======
      );
>>>>>>> 3c9bb58 (Simplify the checkout page)
    } else {
      columnChildren.add(
        ElevatedButton(
          onPressed: _processPayment,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
=======
>>>>>>> ef53ff8 (Add the checkout page)
          child: const Text('Confirm Payment', style: normalText),
        ),
      );
    }
<<<<<<< HEAD
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> orderItems = _buildOrderItems();
    final List<Widget> paymentSection = _buildPaymentSection();
>>>>>>> 51d5237 (Simplify checkout screen)
=======
>>>>>>> 3c9bb58 (Simplify the checkout page)

=======
>>>>>>> e1ed5d6 (Updated each screen for preparation)
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: const Text('Checkout', style: heading1),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 4),
                    Text('${cart.countOfItems}'),
                  ],
                ),
              );
            },
          ),
        ],
      ),
<<<<<<< HEAD
<<<<<<< HEAD
      body: Padding(
<<<<<<< HEAD
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: columnChildren,
=======
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
<<<<<<< HEAD
          children: [
            const Text('Order Summary', style: heading2),
            const SizedBox(height: 20),
            ...orderItems,
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: heading2),
                Text(
                  '£${widget.cart.totalPrice.toStringAsFixed(2)}',
                  style: heading2,
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Payment Method: Card ending in 1234',
              style: normalText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...paymentSection,
          ],
>>>>>>> 51d5237 (Simplify checkout screen)
=======
          children: columnChildren,
>>>>>>> 3c9bb58 (Simplify the checkout page)
        ),
=======
      body: Column(
        children: columnChildren,
>>>>>>> ef53ff8 (Add the checkout page)
=======
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            List<Widget> columnChildren = [];

            columnChildren.add(const Text('Order Summary', style: heading2));
            columnChildren.add(const SizedBox(height: 20));

            for (MapEntry<Sandwich, int> entry in cart.items.entries) {
              final Sandwich sandwich = entry.key;
              final int quantity = entry.value;
              final double itemPrice = _calculateItemPrice(sandwich, quantity);

              final Widget itemRow = Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${quantity}x ${sandwich.name}',
                    style: normalText,
                  ),
                  Text(
                    '£${itemPrice.toStringAsFixed(2)}',
                    style: normalText,
                  ),
                ],
              );

              columnChildren.add(itemRow);
              columnChildren.add(const SizedBox(height: 8));
            }

            columnChildren.add(const Divider());
            columnChildren.add(const SizedBox(height: 10));

            final Widget totalRow = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: heading2),
                Text(
                  '£${cart.totalPrice.toStringAsFixed(2)}',
                  style: heading2,
                ),
              ],
            );
            columnChildren.add(totalRow);
            columnChildren.add(const SizedBox(height: 40));

            columnChildren.add(
              const Text(
                'Payment Method: Card ending in 1234',
                style: normalText,
                textAlign: TextAlign.center,
              ),
            );
            columnChildren.add(const SizedBox(height: 20));

            if (_isProcessing) {
              columnChildren.add(
                const Center(
                  child: CircularProgressIndicator(),
                ),
              );
              columnChildren.add(const SizedBox(height: 20));
              columnChildren.add(
                const Text(
                  'Processing payment...',
                  style: normalText,
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              columnChildren.add(
                ElevatedButton(
                  onPressed: _processPayment,
                  child: const Text('Confirm Payment', style: normalText),
                ),
              );
            }

            return Column(
              children: columnChildren,
            );
          },
        ),
>>>>>>> c12b154 (Remove order cancellation)
      ),
    );
  }
}
