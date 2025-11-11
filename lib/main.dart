import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/repositories/order_repository.dart';
>>>>>>> 40459b4 (Added a import to fix errors)

void main() {
  runApp(const App());
}

enum BreadType { white, wheat, wholemeal }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: Text('Welcome to the Sandwich Shop!'),
          body: Column(
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OrderItemDisplay(3, 'BLT'),
                  OrderItemDisplay(5, 'Club'),
                  OrderItemDisplay(2, 'Veggie'),
                ]),
            Spacer(),
            Center(
              child: Container(
                width: 400,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: OrderItemDisplay(5, 'Footlong'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

<<<<<<< HEAD
class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;
  const OrderItemDisplay(this.quantity, this.itemType, {super.key});
=======
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
>>>>>>> e6df372 (Fix all errors regarding missing methods and variables)

  @override
  Widget build(BuildContext context) {
    ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: normalText,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: myButtonStyle,
      child: Row(
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
    String displayText =
        '$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}';

    return Column(
      children: [
        Text(
          displayText,
          style: normalText,
        ),
        const SizedBox(height: 8),
        Text(
          'Note: $orderNote',
          style: normalText,
        ),
      ],
    );
  }
}
