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
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$quantity $itemType sandwich(es): ${'🥪' * quantity}',
      style: const TextStyle(fontSize: 16),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class StyledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool enabled;

  const StyledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
      ),
      child: Text(label),
    );
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _footlongQuantity = 0;
  int _sixInchQuantity = 0;
  String _selectedType = 'Footlong';

  void _increaseQuantity() {
    setState(() {
      if (_selectedType == 'Footlong' &&
          _footlongQuantity < widget.maxQuantity) {
        _footlongQuantity++;
      } else if (_selectedType == 'Six-inch' &&
          _sixInchQuantity < widget.maxQuantity) {
        _sixInchQuantity++;
      }
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_selectedType == 'Footlong' && _footlongQuantity > 0) {
        _footlongQuantity--;
      } else if (_selectedType == 'Six-inch' && _sixInchQuantity > 0) {
        _sixInchQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int currentQuantity =
        _selectedType == 'Footlong' ? _footlongQuantity : _sixInchQuantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'Footlong',
                  label: Text('Footlong'),
                ),
                ButtonSegment(
                  value: 'Six-inch',
                  label: Text('Six-inch'),
                ),
              ],
              selected: {_selectedType},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedType = newSelection.first;
                });
              },
            ),
            const SizedBox(height: 20),
            OrderItemDisplay(currentQuantity, _selectedType),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton(
                  label: 'Add',
                  onPressed: _increaseQuantity,
                  enabled: (_selectedType == 'Footlong' &&
                          _footlongQuantity < widget.maxQuantity) ||
                      (_selectedType == 'Six-inch' &&
                          _sixInchQuantity < widget.maxQuantity),
                ),
                const SizedBox(width: 16),
                StyledButton(
                  label: 'Remove',
                  onPressed: _decreaseQuantity,
                  enabled:
                      (_selectedType == 'Footlong' && _footlongQuantity > 0) ||
                          (_selectedType == 'Six-inch' && _sixInchQuantity > 0),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
