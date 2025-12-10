import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/views/checkout_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CheckoutScreen', () {
    setUpAll(() {
      initializeTestDatabase();
    });

    testWidgets('displays default checkout layout when cart is empty',
        (WidgetTester tester) async {
      final cart = Cart();

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Checkout'), findsOneWidget);
      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('Payment Method: Card ending in 1234'), findsOneWidget);
      expect(find.text('Confirm Payment'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
    });

    testWidgets('displays order summary with a single item',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('2x Veggie Delight'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
    });

    testWidgets('displays order summary with multiple items',
        (WidgetTester tester) async {
      final cart = Cart();

      final s1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final s2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.addItem(s1, quantity: 1);
      cart.addItem(s2, quantity: 3);

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.text('3x Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
    });

    testWidgets('confirm payment button appears initially',
        (WidgetTester tester) async {
      final cart = Cart();

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Confirm Payment'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Processing payment...'), findsNothing);
    });

    testWidgets('shows processing state after confirming payment',
        (WidgetTester tester) async {
      final cart = Cart();
      cart.addItem(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: true,
          breadType: BreadType.white,
        ),
        quantity: 1,
      );

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      // Tap confirm payment
      await tester.tap(find.text('Confirm Payment'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Processing payment...'), findsOneWidget);
      expect(find.text('Confirm Payment'), findsNothing);

      await tester.pump(const Duration(seconds: 3)); // allow process to finish
    });

    testWidgets('correct price shown for footlong sandwiches',
        (WidgetTester tester) async {
      final cart = Cart();

      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.addItem(footlong, quantity: 1);

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.textContaining('£11.00'), findsWidgets);
      expect(find.text('1x Veggie Delight'), findsOneWidget);
    });

    testWidgets('correct price shown for six-inch sandwiches',
        (WidgetTester tester) async {
      final cart = Cart();

      final sixInch = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.addItem(sixInch, quantity: 1);

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.textContaining('£7.00'), findsWidgets);
      expect(find.text('1x Veggie Delight'), findsOneWidget);
    });

    testWidgets('correct total price for mixed items',
        (WidgetTester tester) async {
      final cart = Cart();

      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      final sixInch = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.addItem(footlong, quantity: 1); // £11
      cart.addItem(sixInch, quantity: 2); // £14
      // total = £25

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.text('2x Chicken Teriyaki'), findsOneWidget);
      expect(find.textContaining('£25.00'), findsWidgets);
    });

    testWidgets('payment method text is centered', (WidgetTester tester) async {
      final cart = Cart();

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      final Finder paymentTextFinder =
          find.text('Payment Method: Card ending in 1234');

      expect(paymentTextFinder, findsOneWidget);

      final Text text = tester.widget(paymentTextFinder);
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('correct name + quantity format', (WidgetTester tester) async {
      final cart = Cart();

      final s = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      cart.addItem(s, quantity: 3);

      final app = createTestApp(const CheckoutScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('3x Chicken Teriyaki'), findsOneWidget);
    });
  });
}
