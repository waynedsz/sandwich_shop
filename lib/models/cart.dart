import 'sandwich.dart';

<<<<<<< HEAD
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

=======
class Cart {
  final List<Sandwich> _items = [];

  // This is a getter that exposes a read-only copy of the items
  // to prevent accidental modification from outside the class.
  List<Sandwich> get items => List.unmodifiable(_items);

  void add(Sandwich sandwich) {
    _items.add(sandwich);
  }

  void remove(Sandwich sandwich) {
    _items.remove(sandwich);
  }

>>>>>>> 98d78f8 (Add cart model)
  void clear() {
    _items.clear();
  }

<<<<<<< HEAD
  bool contains(Sandwich sandwich) {
    return _items.any((item) => item.sandwich == sandwich);
  }
=======
  double get totalPrice {
    return 0.0;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;
>>>>>>> 98d78f8 (Add cart model)
}
