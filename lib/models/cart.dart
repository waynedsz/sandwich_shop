import 'sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

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
  final Map<Sandwich, int> _items = {};

  // Returns a read-only copy of the items and their quantities
  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  void add(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  void remove(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      final currentQty = _items[sandwich]!;
      if (currentQty > quantity) {
        _items[sandwich] = currentQty - quantity;
      } else {
        _items.remove(sandwich);
      }
    }
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
    final pricingRepository = PricingRepository();
    double total = 0.0;

    _items.forEach((sandwich, quantity) {
      total += pricingRepository.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    });

    return total;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;
<<<<<<< HEAD
>>>>>>> 98d78f8 (Add cart model)
=======

  int getQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      return _items[sandwich]!;
    }
    return 0;
  }
>>>>>>> c6a9bfb (Update cart model)
}
