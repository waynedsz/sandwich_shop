import 'package:flutter/material.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/views/order_screen_view.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';

class CartViewScreen extends StatefulWidget {
  final Cart cart;

  const CartViewScreen({super.key, required this.cart});

  @override
  State<CartViewScreen> createState() {
    return _CartViewScreenState();
  }
}

class _CartViewScreenState extends State<CartViewScreen> {
  Future<void> _navigateToCheckout() async {
    final bool cartIsEmpty = widget.cart.items.isEmpty;

    if (cartIsEmpty) {
      const SnackBar emptyCartSnackBar = SnackBar(
        content: Text('Your cart is empty'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(emptyCartSnackBar);
      return;
    }

    final Map<String, dynamic>? result =
        await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute<Map<String, dynamic>>(
        builder: (BuildContext context) => CheckoutScreen(cart: widget.cart),
      ),
    );

    final bool hasResult = result != null;
    final bool widgetStillMounted = mounted;

    if (hasResult && widgetStillMounted) {
      final String status = result['status'] as String;

      if (status == 'confirmed') {
        _handleConfirmedOrder(result);
      } else if (status == 'cancelled') {
        _handleCancelledOrder();
      }
    }
  }

  void _handleConfirmedOrder(Map<String, dynamic> orderData) {
    setState(() {
      widget.cart.clear();
    });

    final String orderId = orderData['orderId'] as String;
    final String estimatedTime = orderData['estimatedTime'] as String;

    final String successMessage =
        'Order $orderId confirmed! Estimated time: $estimatedTime';
    final SnackBar successSnackBar = SnackBar(
      content: Text(successMessage),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.green,
    );

    ScaffoldMessenger.of(context).showSnackBar(successSnackBar);

    Navigator.pop(context);
  }

  void _handleCancelledOrder() {
    const SnackBar cancelledSnackBar = SnackBar(
      content: Text('Order cancelled'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(cancelledSnackBar);
  }

  void _goBack() {
    Navigator.pop(context);
  }

  String _getSizeText(bool isFootlong) {
    if (isFootlong) {
      return 'Footlong';
    } else {
      return 'Six-inch';
    }
  }

  double _getItemPrice(Sandwich sandwich, int quantity) {
    final PricingRepository pricingRepository = PricingRepository();
    return pricingRepository.calculatePrice(
      quantity: quantity,
      isFootlong: sandwich.isFootlong,
    );
  }

  void _incrementQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart.add(sandwich, quantity: 1);
    });
  }

  void _decrementQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart.remove(sandwich, quantity: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: const Text(
          'Cart View',
          style: heading1,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              for (MapEntry<Sandwich, int> entry in widget.cart.items.entries)
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
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Text(
                'Total: £${widget.cart.totalPrice.toStringAsFixed(2)}',
                style: heading2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Builder(
                builder: (BuildContext context) {
                  final bool cartHasItems = widget.cart.items.isNotEmpty;
                  if (cartHasItems) {
                    return StyledButton(
                      onPressed: _navigateToCheckout,
                      icon: Icons.payment,
                      label: 'Checkout',
                      backgroundColor: Colors.orange,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _goBack,
                icon: Icons.arrow_back,
                label: 'Back to Order',
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
