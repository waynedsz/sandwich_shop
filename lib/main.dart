import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Welcome to the Sandwich Shop!'),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OrderItemDisplay(3, 'BLT'),
                OrderItemDisplay(5, 'Club'),
                OrderItemDisplay(2, 'Veggie'),
              ],
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 400,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const OrderItemDisplay(5, 'Footlong'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;
  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}
