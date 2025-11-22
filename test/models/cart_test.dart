import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    final sandwich1 = Sandwich(
      type: SandwichType.veggieDelight,
      isFootlong: false,
      breadType: BreadType.white,
    );
    final sandwich2 = Sandwich(
      type: SandwichType.chickenTeriyaki,
      isFootlong: true,
      breadType: BreadType.wheat,
    );

    test('addItem adds new item', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      expect(cart.items.length, 1);
      expect(cart.items.first.sandwich, sandwich1);
      expect(cart.items.first.quantity, 1);
    });

    test('addItem increases quantity if item exists', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      cart.addItem(sandwich1, quantity: 2);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 3);
    });

    test('removeItem removes item', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      cart.removeItem(sandwich1);
      expect(cart.items.length, 0);
    });

    test('updateQuantity changes quantity', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      cart.updateQuantity(sandwich1, 5);
      expect(cart.items.first.quantity, 5);
    });

    test('updateQuantity removes item if quantity is 0', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      cart.updateQuantity(sandwich1, 0);
      expect(cart.items.length, 0);
    });

    test('totalItems returns correct sum', () {
      final cart = Cart();
      cart.addItem(sandwich1, quantity: 2);
      cart.addItem(sandwich2, quantity: 3);
      expect(cart.totalItems, 5);
    });

    test('clear removes all items', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      cart.addItem(sandwich2);
      cart.clear();
      expect(cart.items.length, 0);
    });

    test('contains returns true if item exists', () {
      final cart = Cart();
      cart.addItem(sandwich1);
      expect(cart.contains(sandwich1), isTrue);
      expect(cart.contains(sandwich2), isFalse);
    });
  });
}
