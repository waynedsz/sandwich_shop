import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
=======
>>>>>>> 189705e (Add cart unit tests)
=======
>>>>>>> 189705e (Add cart unit tests)
    late Cart cart;
    late Sandwich sandwichA;
    late Sandwich sandwichB;

    setUp(() {
      cart = Cart();
      sandwichA = Sandwich(
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: false,
      );
      sandwichB = Sandwich(
        type: SandwichType.chickenTeriyaki,
        breadType: BreadType.wheat,
        isFootlong: true,
      );
=======
=======
>>>>>>> 189705e (Add cart unit tests)
          name: 'A',
          isFootlong: false,
          breadType: BreadType.wheat,
          image: 'assets/images/a.png');
      sandwichB = Sandwich(
          name: 'B',
          isFootlong: true,
          breadType: BreadType.white,
          image: 'assets/images/b.png');
<<<<<<< HEAD
>>>>>>> 189705e (Add cart unit tests)
=======
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      sandwichB = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.white,
      );
>>>>>>> c5cc817 (Update the cart test)
=======
>>>>>>> 189705e (Add cart unit tests)
    });

    test('should start empty', () {
      expect(cart.isEmpty, isTrue);
      expect(cart.length, 0);
      expect(cart.items, isEmpty);
    });

    test('should add a sandwich with default quantity 1', () {
      cart.add(sandwichA);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.length, 1);
      expect(cart.isEmpty, isFalse);
    });

    test('should add a sandwich with custom quantity', () {
      cart.add(sandwichA, quantity: 3);
      expect(cart.getQuantity(sandwichA), 3);
      expect(cart.length, 1);
    });

    test('should increase quantity if same sandwich is added again', () {
      cart.add(sandwichA);
      cart.add(sandwichA, quantity: 2);
      expect(cart.getQuantity(sandwichA), 3);
    });

    test('should add multiple different sandwiches', () {
      cart.add(sandwichA);
      cart.add(sandwichB, quantity: 2);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.getQuantity(sandwichB), 2);
      expect(cart.length, 2);
    });

    test('should remove quantity of a sandwich', () {
      cart.add(sandwichA, quantity: 3);
      cart.remove(sandwichA, quantity: 2);
      expect(cart.getQuantity(sandwichA), 1);
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      expect(cart.length, 1);
=======
>>>>>>> 189705e (Add cart unit tests)
=======
      expect(cart.length, 1);
>>>>>>> c5cc817 (Update the cart test)
=======
>>>>>>> 189705e (Add cart unit tests)
    });

    test('should remove sandwich completely if quantity drops to zero', () {
      cart.add(sandwichA, quantity: 2);
      cart.remove(sandwichA, quantity: 2);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.isEmpty, isTrue);
      expect(cart.length, 0);
    });

    test('should not throw an error when removing a sandwich not in cart', () {
      expect(() => cart.remove(sandwichA), returnsNormally);
    });

    test('should clear all items', () {
      cart.add(sandwichA);
      cart.add(sandwichB);
      cart.clear();
      expect(cart.isEmpty, isTrue);
      expect(cart.items, isEmpty);
    });

    test('getQuantity returns correct quantity', () {
      cart.add(sandwichA, quantity: 4);
      expect(cart.getQuantity(sandwichA), 4);
      expect(cart.getQuantity(sandwichB), 0);
    });

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c5cc817 (Update the cart test)
    test('items getter is unmodifiable', () {
      cart.add(sandwichA);
      final Map<Sandwich, int> items = cart.items;
      expect(() => items[sandwichB] = 2, throwsUnsupportedError);
    });

<<<<<<< HEAD
    test('totalPrice calculates sum using PricingRepository', () {
<<<<<<< HEAD
      cart.add(sandwichA, quantity: 2); // 2 * 7 = 14
      cart.add(sandwichB, quantity: 1); // 1 * 11 = 11
      expect(cart.totalPrice, 25.0);
>>>>>>> 189705e (Add cart unit tests)
=======
      cart.add(sandwichA, quantity: 2);
      cart.add(sandwichB, quantity: 1);
      expect(cart.totalPrice, isA<double>());
      expect(cart.totalPrice, greaterThan(0));
    });

    test('should handle adding and removing multiple sandwiches correctly', () {
      cart.add(sandwichA, quantity: 2);
      cart.add(sandwichB, quantity: 3);
      cart.remove(sandwichA, quantity: 1);
      cart.remove(sandwichB, quantity: 2);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.getQuantity(sandwichB), 1);
      expect(cart.length, 2);
    });

    test('should not allow negative quantities', () {
      cart.add(sandwichA, quantity: 2);
      cart.remove(sandwichA, quantity: 5);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.isEmpty, isTrue);
>>>>>>> c5cc817 (Update the cart test)
    });

    test('incrementQuantity respects maxQuantity', () {
      for (int i = 0; i < 10; i++) {
        cart.incrementQuantity(sandwichA);
      }
      expect(cart.getQuantity(sandwichA), Cart.maxQuantity);
    });

    test('decrementQuantity removes item at zero', () {
      cart.add(sandwichA, quantity: 1);
      cart.decrementQuantity(sandwichA);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.items.containsKey(sandwichA), false);
    });

    test('setQuantity respects min and max', () {
      cart.setQuantity(sandwichA, 0);
      expect(cart.getQuantity(sandwichA), 0);
      cart.setQuantity(sandwichA, 10);
      expect(cart.getQuantity(sandwichA), Cart.maxQuantity);
    });

    test('removeItem removes item', () {
      cart.add(sandwichA, quantity: 2);
      cart.removeItem(sandwichA);
      expect(cart.getQuantity(sandwichA), 0);
    });

    test('removeAll clears the cart', () {
      cart.add(sandwichA, quantity: 1);
      cart.add(sandwichB, quantity: 1);
      cart.removeAll();
      expect(cart.items.isEmpty, true);
=======
=======
>>>>>>> 189705e (Add cart unit tests)
    test('totalPrice calculates sum using PricingRepository', () {
      cart.add(sandwichA, quantity: 2); // 2 * 7 = 14
      cart.add(sandwichB, quantity: 1); // 1 * 11 = 11
      expect(cart.totalPrice, 25.0);
<<<<<<< HEAD
>>>>>>> 189705e (Add cart unit tests)
=======
    test('totalPrice calculates sum using PricingRepository', () {
      cart.add(sandwichA, quantity: 2);
      cart.add(sandwichB, quantity: 1);
      expect(cart.totalPrice, isA<double>());
      expect(cart.totalPrice, greaterThan(0));
    });

    test('should handle adding and removing multiple sandwiches correctly', () {
      cart.add(sandwichA, quantity: 2);
      cart.add(sandwichB, quantity: 3);
      cart.remove(sandwichA, quantity: 1);
      cart.remove(sandwichB, quantity: 2);
      expect(cart.getQuantity(sandwichA), 1);
      expect(cart.getQuantity(sandwichB), 1);
      expect(cart.length, 2);
    });

    test('should not allow negative quantities', () {
      cart.add(sandwichA, quantity: 2);
      cart.remove(sandwichA, quantity: 5);
      expect(cart.getQuantity(sandwichA), 0);
      expect(cart.isEmpty, isTrue);
>>>>>>> c5cc817 (Update the cart test)
=======
>>>>>>> 189705e (Add cart unit tests)
    });
  });
}
