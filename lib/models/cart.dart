import 'sandwich.dart';

class CartItem {
  final Sandwich sandwich;
  int quantity;

  CartItem({required this.sandwich, this.quantity = 1});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          sandwich == other.sandwich;

  @override
  int get hashCode => sandwich.hashCode;
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  void addItem(Sandwich sandwich, {int quantity = 1}) {
    final index = _items.indexWhere((item) => item.sandwich == sandwich);
    if (index != -1) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(sandwich: sandwich, quantity: quantity));
    }
  }

  void removeItem(Sandwich sandwich) {
    _items.removeWhere((item) => item.sandwich == sandwich);
  }

  void updateQuantity(Sandwich sandwich, int quantity) {
    final index = _items.indexWhere((item) => item.sandwich == sandwich);
    if (index != -1) {
      if (quantity <= 0) {
        removeItem(sandwich);
      } else {
        _items[index].quantity = quantity;
      }
    }
  }

  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  void clear() {
    _items.clear();
  }

  bool contains(Sandwich sandwich) {
    return _items.any((item) => item.sandwich == sandwich);
  }
}
