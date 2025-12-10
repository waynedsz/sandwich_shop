import 'package:flutter/foundation.dart';
import 'sandwich.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';

class Cart extends ChangeNotifier {
  /// Get price for a specific sandwich and quantity
  double getItemPrice(Sandwich sandwich, int quantity) {
    return PricingRepository(
            quantity: quantity, isFootlong: sandwich.isFootlong)
        .getTotalPrice();
  }

  final Map<Sandwich, int> _items = {};

  Map<Sandwich, int> get items => Map.unmodifiable(_items);

  void addItem(Sandwich sandwich, {int quantity = 1}) {
    if (_items.containsKey(sandwich)) {
      _items[sandwich] = _items[sandwich]! + quantity;
    } else {
      _items[sandwich] = quantity;
    }
    notifyListeners();
  }

  void removeItem(Sandwich sandwich) {
    if (_items.containsKey(sandwich)) {
      _items.remove(sandwich);
      notifyListeners();
    }
  }

  void updateQuantity(Sandwich sandwich, int quantity) {
    if (_items.containsKey(sandwich)) {
      if (quantity <= 0) {
        _items.remove(sandwich);
      } else {
        _items[sandwich] = quantity;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((sandwich, quantity) {
      total += getItemPrice(sandwich, quantity);
    });
    return total;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;

  int get countOfItems {
    int total = 0;
    for (int qty in _items.values) {
      total += qty;
    }
    return total;
  }

  int getQuantity(Sandwich sandwich) {
    return _items[sandwich] ?? 0;
  }
}
