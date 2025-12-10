import 'package:flutter/material.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';
import 'package:sandwich_shop/views/app_styles.dart';

void main() {
  runApp(const App());
}

enum BreadType { white, wheat, wholemeal }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      debugShowCheckedModeBanner: false,
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late final OrderRepository _orderRepository;
  final TextEditingController _notesController = TextEditingController();

  bool _isFootlong = true;
  bool _isToasted = false;
  BreadType _selectedBreadType = BreadType.white;

  @override
  void initState() {
    super.initState();
    _orderRepository = OrderRepository(maxQuantity: widget.maxQuantity);
    _notesController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  VoidCallback? _getIncreaseCallback() => _orderRepository.canIncrement
      ? () => setState(_orderRepository.increment)
      : null;

  VoidCallback? _getDecreaseCallback() => _orderRepository.canDecrement
      ? () => setState(_orderRepository.decrement)
      : null;

  void _onSandwichTypeChanged(bool value) =>
      setState(() => _isFootlong = value);

  void _onBreadTypeSelected(BreadType? value) {
    if (value != null) setState(() => _selectedBreadType = value);
  }

  @override
  Widget build(BuildContext context) {
    final pricingRepository = PricingRepository(
      quantity: _orderRepository.quantity,
      isFootlong: _isFootlong,
    );

    final totalPrice = pricingRepository.getTotalPrice();

    final sandwichType = _isFootlong ? "footlong" : "six-inch";

    final noteForDisplay = _notesController.text.isEmpty
        ? "No notes added."
        : _notesController.text;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandwich Counter", style: heading1),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              OrderItemDisplay(
                quantity: _orderRepository.quantity,
                itemType: sandwichType,
                breadType: _selectedBreadType,
                orderNote: noteForDisplay,
              ),

              const SizedBox(height: 10),

              Text(
                "Total Price: £${totalPrice.toStringAsFixed(2)}",
                style: heading1,
              ),

              const SizedBox(height: 20),

              // Sandwich size switch
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("six-inch", style: normalText),
                  Switch(
                    key: const Key('sandwichTypeSwitch'),
                    value: _isFootlong,
                    onChanged: _onSandwichTypeChanged,
                  ),
                  const Text("footlong", style: normalText),
                ],
              ),

              // Toasted switch
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("untoasted", style: normalText),
                  Switch(
                    key: const Key('toastedSwitch'),
                    value: _isToasted,
                    onChanged: (value) => setState(() => _isToasted = value),
                  ),
                  const Text("toasted", style: normalText),
                ],
              ),

              const SizedBox(height: 10),

              // Bread dropdown
              DropdownButton<BreadType>(
                value: _selectedBreadType,
                items: BreadType.values.map((bread) {
                  return DropdownMenuItem(
                    value: bread,
                    child: Text(bread.name, style: normalText),
                  );
                }).toList(),
                onChanged: _onBreadTypeSelected,
              ),

              const SizedBox(height: 20),

              // Notes text field
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  key: const Key('notes_textfield'),
                  controller: _notesController,
                  decoration: const InputDecoration(
                    labelText: 'Add a note (e.g., no onions)',
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Quantity buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _getDecreaseCallback(),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${_orderRepository.quantity}",
                    style: heading1,
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _getIncreaseCallback(),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

/// Styled button reused in app
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

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      textStyle: normalText,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
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

/// Order item display widget
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
    final display =
        "$quantity ${breadType.name} $itemType sandwich(es): ${'🥪' * quantity}";

    return Column(
      children: [
        Text(display, style: normalText),
        const SizedBox(height: 8),
        Text("Note: $orderNote", style: normalText),
      ],
    );
  }
}
