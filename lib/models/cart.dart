import 'sandwich.dart';
<<<<<<< HEAD
<<<<<<< HEAD
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

  static const int maxQuantity = 5;
  static const int minQuantity = 1;

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
=======
=======
import 'package:sandwich_shop/repositories/pricing_repository.dart';
>>>>>>> c6a9bfb (Update cart model)

class Cart {
  final Map<Sandwich, int> _items = {};

<<<<<<< HEAD
  void add(Sandwich sandwich) {
    _items.add(sandwich);
=======
  // Returns a read-only copy of the items and their quantities
  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  void add(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
>>>>>>> c6a9bfb (Update cart model)
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
<<<<<<< HEAD
  bool contains(Sandwich sandwich) {
    return _items.any((item) => item.sandwich == sandwich);
  }
=======
  double get totalPrice {
    final pricingRepository = PricingRepository();
    double total = 0.0;

    for (Sandwich sandwich in _items.keys) {
      int quantity = _items[sandwich]!;
      total += pricingRepository.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    }

    return total;
=======
  double get totalPrice {
<<<<<<< HEAD
    return 0.0;
>>>>>>> 98d78f8 (Add cart model)
=======
    final pricingRepository = PricingRepository();
    double total = 0.0;

    _items.forEach((sandwich, quantity) {
      total += pricingRepository.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    });

    return total;
>>>>>>> c6a9bfb (Update cart model)
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 98d78f8 (Add cart model)
=======

  int get countOfItems {
    int total = 0;
    for (Sandwich sandwich in _items.keys) {
      total += _items[sandwich]!;
    }
    return total;
  }
=======
>>>>>>> c6a9bfb (Update cart model)

  int get countOfItems {
    int total = 0;
    _items.forEach((sandwich, quantity) {
      total += quantity;
    });
    return total;
  }

  int getQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      return _items[sandwich]!;
    }
    return 0;
  }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> c6a9bfb (Update cart model)
=======

  /// Increases the quantity of a sandwich by 1, up to maxQuantity.
  void incrementQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      int current = _items[sandwich]!;
      if (current < maxQuantity) {
        _items[sandwich] = current + 1;
      }
    }
  }

  /// Decreases the quantity of a sandwich by 1. Removes the item if quantity reaches 0.
  void decrementQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      int current = _items[sandwich]!;
      if (current > minQuantity) {
        _items[sandwich] = current - 1;
      } else {
        _items.remove(sandwich);
      }
    }
  }

  /// Sets the quantity of a sandwich directly, respecting min/max constraints.
  void setQuantity(Sandwich sandwich, int quantity) {
    if (quantity < minQuantity) {
      _items.remove(sandwich);
    } else if (quantity > maxQuantity) {
      _items[sandwich] = maxQuantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  /// Removes a sandwich from the cart entirely.
  void removeItem(Sandwich sandwich) {
    _items.remove(sandwich);
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
  }
>>>>>>> 75a47da (Update cart.dart & cart_screen.dart to fit requirements.md)
=======
>>>>>>> 98d78f8 (Add cart model)
=======
>>>>>>> c6a9bfb (Update cart model)
}
