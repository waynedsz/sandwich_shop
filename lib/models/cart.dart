import 'sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class Cart {
  final Map<Sandwich, int> _items = {};

  static const int maxQuantity = 5;
  static const int minQuantity = 1;

  /// Read-only view of items in cart
  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  /// Add a sandwich to the cart (increments if it exists)
  void addItem(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  /// Remove a single unit or the entire item
  void removeItem(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      final currentQty = _items[sandwich]!;
      if (currentQty > quantity) {
        _items[sandwich] = currentQty - quantity;
      } else {
        _items.remove(sandwich);
      }
    }
  }

  /// Completely clear cart
  void clear() {
    _items.clear();
  }

  /// Total number of sandwiches (sum of quantities)
  int get totalItems {
    int total = 0;
    for (final qty in _items.values) {
      total += qty;
    }
    return total;
  }

  /// Total number of sandwiches (sum of quantities) - alias for compatibility
  int get itemCount => totalItems;

  /// Total distinct products
  int get length => _items.length;

  /// Total price using PricingRepository
  double get totalPrice {
    final pricingRepo = PricingRepository();
    double total = 0.0;

    _items.forEach((sandwich, quantity) {
      total += pricingRepo.calculatePrice(
        quantity: quantity,
        isFootlong: sandwich.isFootlong,
      );
    });

    return total;
  }

  /// Get quantity of a specific sandwich
  int getQuantity(Sandwich sandwich) {
    return _items[sandwich] ?? 0;
  }

  /// Increase quantity by 1 (up to maxQuantity)
  void incrementQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      int current = _items[sandwich]!;
      if (current < maxQuantity) {
        _items[sandwich] = current + 1;
      }
    }
  }

  /// Decrease quantity by 1 (removes item if 0)
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

  /// Set quantity directly with min/max rules
  void setQuantity(Sandwich sandwich, int quantity) {
    if (quantity < minQuantity) {
      _items.remove(sandwich);
    } else if (quantity > maxQuantity) {
      _items[sandwich] = maxQuantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  /// Remove sandwich entirely
  void removeAllOf(Sandwich sandwich) {
    _items.remove(sandwich);
  }
}
