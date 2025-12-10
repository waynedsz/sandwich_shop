import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    late Cart cart;
    late Sandwich sandwich1;
    late Sandwich sandwich2;

    setUp(() {
      cart = Cart();

      sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );

      sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
    });

    test('addItem adds a new sandwich with quantity 1', () {
      cart.addItem(sandwich1);
      expect(cart.items.length, 1);
      expect(cart.items.containsKey(sandwich1), isTrue);
      expect(cart.items[sandwich1], 1);
    });

    test('addItem increases quantity if item already exists', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich1, quantity: 2);
      expect(cart.items.length, 1);
      expect(cart.items[sandwich1], 3);
    });

    test('removeItem removes the sandwich completely', () {
      cart.addItem(sandwich1);
      cart.removeItem(sandwich1);
      expect(cart.items.length, 0);
    });

    test('updateQuantity changes quantity', () {
      cart.addItem(sandwich1);
      cart.updateQuantity(sandwich1, 5);
      expect(cart.items[sandwich1], 5);
    });

    test('updateQuantity removes item if quantity is 0', () {
      cart.addItem(sandwich1);
      cart.updateQuantity(sandwich1, 0);
      expect(cart.items.length, 0);
    });

    test('totalItems returns sum of all quantities', () {
      cart.addItem(sandwich1, quantity: 2);
      cart.addItem(sandwich2, quantity: 3);
      expect(cart.totalItems, 5);
    });

    test('clear removes all items', () {
      cart.addItem(sandwich1);
      cart.addItem(sandwich2);
      cart.clear();
      expect(cart.items.length, 0);
    });

    test('contains returns true only if sandwich exists', () {
      cart.addItem(sandwich1);
      expect(cart.contains(sandwich1), isTrue);
      expect(cart.contains(sandwich2), isFalse);
    });

    test('totalPrice matches pricing repository output', () {
      // Expected pricing: six-inch = £7, footlong = £11
      cart.addItem(sandwich1, quantity: 2); // 2 × £7 = 14
      cart.addItem(sandwich2, quantity: 1); // 1 × £11 = 11
      expect(cart.totalPrice, 25.0);
    });
  });
}
