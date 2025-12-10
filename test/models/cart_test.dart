import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    late Cart cart;
    late Sandwich sandwichA;
    late Sandwich sandwichB;

    setUp(() {
      cart = Cart();

      sandwichA = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      sandwichB = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.white,
      );
    });

    test('starts empty', () {
      expect(cart.isEmpty, isTrue);
      expect(cart.length, 0);
      expect(cart.items, isEmpty);
    });

    test('adds a sandwich with default quantity of 1', () {
      cart.addItem(sandwichA);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.length, 1);
    });

    test('adds a sandwich with custom quantity', () {
      cart.addItem(sandwichA, quantity: 3);
      expect(cart.getQuantity(sandwichA), 3);
      expect(cart.length, 1);
    });

    test('increments quantity when adding item again', () {
      cart.addItem(sandwichA);
      cart.addItem(sandwichA, quantity: 2);
      expect(cart.getQuantity(sandwichA), 3);
    });

    test('adds multiple sandwich types', () {
      cart.addItem(sandwichA);
      cart.addItem(sandwichB, quantity: 2);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.getQuantity(sandwichB), 2);
      expect(cart.length, 2);
    });

    test('remove decreases quantity', () {
      cart.addItem(sandwichA, quantity: 3);
      cart.updateQuantity(sandwichA, 1);
      expect(cart.getQuantity(sandwichA), 1);
    });

    test('remove removes sandwich when quantity hits zero', () {
      cart.addItem(sandwichA, quantity: 2);
      cart.updateQuantity(sandwichA, 0);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.length, 0);
    });

    test('remove on non-existing sandwich does nothing', () {
      expect(() => cart.removeItem(sandwichA), returnsNormally);
    });

    test('clear removes all items', () {
      cart.addItem(sandwichA);
      cart.addItem(sandwichB);
      cart.clear();
      expect(cart.items, isEmpty);
      expect(cart.length, 0);
    });

    test('getQuantity returns correct value', () {
      cart.addItem(sandwichA, quantity: 4);
      expect(cart.getQuantity(sandwichA), 4);
      expect(cart.getQuantity(sandwichB), 0);
    });

    test('items getter is unmodifiable', () {
      cart.addItem(sandwichA);
      final map = cart.items;
      expect(() => map[sandwichB] = 2, throwsUnsupportedError);
    });

    test('incrementQuantity respects maxQuantity', () {
      for (int i = 0; i < 20; i++) {
        cart.incrementQuantity(sandwichA);
      }
      expect(cart.getQuantity(sandwichA), 5);
    });

    test('decrementQuantity removes item at zero', () {
      cart.addItem(sandwichA, quantity: 1);
      cart.decrementQuantity(sandwichA);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.items.containsKey(sandwichA), false);
    });

    test('setQuantity respects 0 and maxQuantity', () {
      cart.updateQuantity(sandwichA, 0);
      expect(cart.getQuantity(sandwichA), 0);

      cart.updateQuantity(sandwichA, 999);
      expect(cart.getQuantity(sandwichA), 999);
    });

    test('removeItem deletes whole entry', () {
      cart.addItem(sandwichA, quantity: 5);
      cart.removeItem(sandwichA);
      expect(cart.getQuantity(sandwichA), 0);
    });

    test('removeAll clears the cart', () {
      cart.addItem(sandwichA);
      cart.addItem(sandwichB);
      cart.clear();
      expect(cart.items.isEmpty, true);
    });

    test('totalPrice returns a valid number', () {
      cart.addItem(sandwichA, quantity: 2);
      cart.addItem(sandwichB, quantity: 1);
      expect(cart.totalPrice, isA<double>());
      expect(cart.totalPrice, greaterThan(0));
    });
  });
}
