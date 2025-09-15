import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';
<<<<<<< HEAD
import 'package:sandwich_shop/views/common_widgets.dart';
=======
import 'package:sandwich_shop/widgets/common_widgets.dart';
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() {
    return _CartScreenState();
  }
}

class _CartScreenState extends State<CartScreen> {
<<<<<<< HEAD
<<<<<<< HEAD
=======
  Future<void> _navigateToCheckout() async {
<<<<<<< HEAD
    final bool cartIsEmpty = widget.cart.items.isEmpty;

    if (cartIsEmpty) {
      const SnackBar emptyCartSnackBar = SnackBar(
        content: Text('Your cart is empty'),
        duration: Duration(seconds: 2),
=======
    final Cart cart = Provider.of<Cart>(context, listen: false);

    if (cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty'),
          duration: Duration(seconds: 2),
        ),
>>>>>>> fdf19a4 (📝 Refactor CartViewScreen to use Provider for Cart management)
      );
      ScaffoldMessenger.of(context).showSnackBar(emptyCartSnackBar);
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutScreen(),
      ),
    );

<<<<<<< HEAD
    final bool hasResult = result != null;
    final bool widgetStillMounted = mounted;
=======
    if (result != null && mounted) {
      cart.clear();
>>>>>>> fdf19a4 (📝 Refactor CartViewScreen to use Provider for Cart management)

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

>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
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

<<<<<<< HEAD
  void _showClearCartDialog() async {
    final shouldClear = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: const Text(
            'Are you sure you want to remove all items from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (shouldClear == true) {
      setState(() {
        widget.cart.removeAll();
      });
    }
  }

=======
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
  Future<void> _navigateToCheckout() async {
    final Cart cart = Provider.of<Cart>(context, listen: false);

    if (cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your cart is empty'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckoutScreen(),
      ),
    );

    if (result != null && mounted) {
      cart.clear();

      final String orderId = result['orderId'] as String;
      final String estimatedTime = result['estimatedTime'] as String;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Order $orderId confirmed! Estimated time: $estimatedTime'),
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

<<<<<<< HEAD
=======
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
=======
  void _incrementQuantity(Sandwich sandwich) {
<<<<<<< HEAD
    setState(() {
      widget.cart.add(sandwich, quantity: 1);
    });
  }

  void _decrementQuantity(Sandwich sandwich) {
    setState(() {
      widget.cart.remove(sandwich, quantity: 1);
    });
=======
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
    final Cart cart = Provider.of<Cart>(context, listen: false);
    cart.add(sandwich, quantity: 1);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quantity increased')),
    );
  }

  void _decrementQuantity(Sandwich sandwich) {
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final wasPresent = cart.items.containsKey(sandwich);
    cart.remove(sandwich, quantity: 1);
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
    final Cart cart = Provider.of<Cart>(context, listen: false);
    cart.remove(sandwich, quantity: cart.getQuantity(sandwich));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from cart')),
    );
<<<<<<< HEAD
  }

>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
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
        title: Text(
          'Cart View',
          style: heading1,
        ),
=======
>>>>>>> fdf19a4 (📝 Refactor CartViewScreen to use Provider for Cart management)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Cart',
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
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
      body: Center(
        child: SingleChildScrollView(
<<<<<<< HEAD
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
<<<<<<< HEAD
<<<<<<< HEAD
              for (MapEntry<Sandwich, int> entry in widget.cart.items.entries)
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  widget.cart.decrementQuantity(entry.key);
                                });
                              },
                            ),
                            Text(
                              '${entry.value}',
                              style: heading2,
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  widget.cart.incrementQuantity(entry.key);
                                });
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          tooltip: 'Remove',
                          onPressed: () {
                            setState(() {
                              widget.cart.removeItem(entry.key);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
=======
              if (widget.cart.items.isEmpty)
                const Text(
                  'Your cart is empty.',
                  style: heading2,
                  textAlign: TextAlign.center,
                )
              else
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
=======
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
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _goBack,
                icon: Icons.arrow_back,
                label: 'Back to Order',
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 20),
            ],
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
=======
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  if (cart.items.isEmpty)
                    Text(
                      'Your cart is empty.',
                      style: heading2,
                      textAlign: TextAlign.center,
                    )
                  else
                    for (MapEntry<Sandwich, int> entry in cart.items.entries)
                      Column(
<<<<<<< HEAD
>>>>>>> e1ed5d6 (Updated each screen for preparation)
=======
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
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
                                tooltip: 'Remove item',
                                onPressed: () => _removeItem(entry.key),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                  Text(
                    'Total: £${cart.totalPrice.toStringAsFixed(2)}',
                    style: heading2,
                    textAlign: TextAlign.center,
                  ),
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
              Text(
                'Total: £${widget.cart.totalPrice.toStringAsFixed(2)}',
                style: heading2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
<<<<<<< HEAD
              StyledButton(
                onPressed: _showClearCartDialog,
                icon: Icons.delete_sweep,
                label: 'Clear Cart',
                backgroundColor: Colors.red,
              ),
              const SizedBox(height: 20),
=======
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
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
              const SizedBox(height: 20),
<<<<<<< HEAD
              const SizedBox(height: 20),
              StyledButton(
                onPressed: _goBack,
=======
              StyledButton(
                onPressed: () => Navigator.pop(context),
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
                icon: Icons.arrow_back,
                label: 'Back to Order',
                backgroundColor: Colors.grey,
              ),
              const SizedBox(height: 20),
            ],
=======
=======
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
                  const SizedBox(height: 20),
                  Builder(
                    builder: (BuildContext context) {
                      final bool cartHasItems = cart.items.isNotEmpty;
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
                  const SizedBox(height: 20),
                  StyledButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icons.arrow_back,
                    label: 'Back to Order',
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
<<<<<<< HEAD
>>>>>>> e1ed5d6 (Updated each screen for preparation)
=======
>>>>>>> fdf19a4 (📝 Refactor CartViewScreen to use Provider for Cart management)
>>>>>>> 6c8bed7 (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
          ),
        ),
      ),
    );
  }
}
