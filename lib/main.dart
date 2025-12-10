import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;
  final TextStyle? textStyle;

  const StyledButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor = Colors.teal,
    this.foregroundColor = Colors.white,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: foregroundColor),
      label: Text(
        label,
        style: textStyle ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textStyle ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
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

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  String _note = '';
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      if (_quantity < widget.maxQuantity) {
        _quantity++;
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 0) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              'Footlong',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (e.g., no onions, extra pickles)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _note = value;
                  });
                },
              ),
            ),
            if (_note.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Note: $_note',
                    style: const TextStyle(fontStyle: FontStyle.italic)),
              ),
            Row(
              children: [
                Expanded(
                  child: StyledButton(
                    onPressed: _quantity < widget.maxQuantity ? _increment : null,
                    label: 'Add',
                    icon: Icons.add,
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: StyledButton(
                    onPressed: _quantity > 0 ? _decrement : null,
                    label: 'Remove',
                    icon: Icons.remove,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
