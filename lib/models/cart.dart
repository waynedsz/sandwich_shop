import 'package:flutter/material.dart';
import 'sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class Cart extends ChangeNotifier {
  /// Update quantity for a sandwich
  void updateQuantity(Sandwich sandwich, int quantity) {
    if (quantity <= 0) {
      _items.remove(sandwich);
    } else {
      _items[sandwich] = quantity;
    }
    notifyListeners();
  }

  /// Check if cart contains a sandwich
  bool contains(Sandwich sandwich) {
    return _items.containsKey(sandwich);
  }

  final Map<Sandwich, int> _items = {};

  static const int maxQuantity = 5;
  static const int minQuantity = 1;

  /// Read-only view of items
  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  /// Add item to cart
  void addItem(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  /// Remove one or remove full item
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

  /// Total quantity of all sandwiches
  int get totalItems {
    int total = 0;
    for (final qty in _items.values) {
      total += qty;
    }
    return total;
  }

  /// Alias used in tests
  int get itemCount => totalItems;

  /// Number of distinct sandwich types in cart
  int get length => _items.length;

  /// Calculate total £ cost
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

  int getQuantity(Sandwich sandwich) {
    return _items[sandwich] ?? 0;
  }

  /// Increment quantity (max 5)
  void incrementQuantity(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      int current = _items[sandwich]!;
      if (current < maxQuantity) {
        _items[sandwich] = current + 1;
      }
    }
  }

  /// Decrement quantity (min 1 → remove)
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

  /// Directly set quantity within min/max range
  void setQuantity(Sandwich sandwich, int quantity) {
    if (quantity < minQuantity) {
      _items.remove(sandwich);
    } else if (quantity > maxQuantity) {
      _items[sandwich] = maxQuantity;
    } else {
      _items[sandwich] = quantity;
    }
  }

  /// Fully remove sandwich
  void removeAllOf(Sandwich sandwich) {
    _items.remove(sandwich);
  }

  /// Clear cart
  void clear() {
    _items.clear();
  }
}
