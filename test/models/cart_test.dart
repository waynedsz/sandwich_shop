import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart (map-based)', () {
    late Cart cart;
    late Sandwich sandwichA;
    late Sandwich sandwichB;

    setUp(() {
      cart = Cart();
      sandwichA = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      sandwichB = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
    });

    test('starts empty', () {
      expect(cart.length, 0);
      expect(cart.totalItems, 0);
      expect(cart.items, isEmpty);
    });

    test('addItem adds new sandwich with correct quantity', () {
      cart.addItem(sandwichA, quantity: 2);

      expect(cart.length, 1);
      expect(cart.getQuantity(sandwichA), 2);
    });

    test('addItem increases quantity when same sandwich is added again', () {
      cart.addItem(sandwichA, quantity: 1);
      cart.addItem(sandwichA, quantity: 3);

      expect(cart.getQuantity(sandwichA), 4);
      expect(cart.length, 1);
    });

    test('addItem supports multiple distinct sandwiches', () {
      cart.addItem(sandwichA, quantity: 1);
      cart.addItem(sandwichB, quantity: 2);

      expect(cart.length, 2);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.getQuantity(sandwichB), 2);
    });

    test('removeItem decreases quantity, removes item if quantity hits zero',
        () {
      cart.addItem(sandwichA, quantity: 3);
      cart.removeItem(sandwichA, quantity: 2);

      expect(cart.getQuantity(sandwichA), 1);

      cart.removeItem(sandwichA, quantity: 1);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.items.containsKey(sandwichA), false);
    });

    test('removeItem does nothing if sandwich not present', () {
      expect(() => cart.removeItem(sandwichA), returnsNormally);
    });

    test('removeAllOf removes the sandwich entirely', () {
      cart.addItem(sandwichA, quantity: 3);

      cart.removeAllOf(sandwichA);

      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.items.containsKey(sandwichA), false);
    });

    test('incrementQuantity increases quantity up to maxQuantity', () {
      cart.addItem(sandwichA, quantity: 4);

      cart.incrementQuantity(sandwichA); // goes to 5 (max)
      cart.incrementQuantity(sandwichA); // ignored

      expect(cart.getQuantity(sandwichA), Cart.maxQuantity);
    });

    test('decrementQuantity decreases quantity and removes at minimum', () {
      cart.addItem(sandwichA, quantity: 2);

      cart.decrementQuantity(sandwichA);
      expect(cart.getQuantity(sandwichA), 1);

      cart.decrementQuantity(sandwichA); // should remove entirely
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.items.containsKey(sandwichA), false);
    });

    test('setQuantity respects min and max limits', () {
      cart.setQuantity(sandwichA, 0); // should remove
      expect(cart.getQuantity(sandwichA), 0);

      cart.setQuantity(sandwichA, 10); // clamp to max = 5
      expect(cart.getQuantity(sandwichA), Cart.maxQuantity);

      cart.setQuantity(sandwichA, 3);
      expect(cart.getQuantity(sandwichA), 3);
    });

    test('totalItems returns sum of all quantities', () {
      cart.addItem(sandwichA, quantity: 2);
      cart.addItem(sandwichB, quantity: 3);

      expect(cart.totalItems, 5);
    });

    test('clear removes all sandwiches', () {
      cart.addItem(sandwichA, quantity: 1);
      cart.addItem(sandwichB, quantity: 1);

      cart.clear();

      expect(cart.length, 0);
      expect(cart.totalItems, 0);
    });

    test('items getter returns unmodifiable map', () {
      cart.addItem(sandwichA);

      final items = cart.items;

      expect(() => items[sandwichB] = 5, throwsUnsupportedError);
    });

    test('totalPrice returns non-zero price when items exist', () {
      cart.addItem(sandwichA, quantity: 2);
      cart.addItem(sandwichB, quantity: 1);

      final price = cart.totalPrice;

      expect(price, isA<double>());
      expect(price, greaterThan(0));
    });
  });
}
