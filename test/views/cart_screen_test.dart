import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/common_widgets.dart';

void main() {
  group('CartScreen', () {
    testWidgets('displays empty cart message when cart is empty',
        (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays cart items when cart has items',
        (WidgetTester tester) async {
      final cart = Cart();

      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text(sandwich.name), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Qty: 2'), findsOneWidget);
      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('displays multiple items correctly',
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

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Six-inch on wheat bread'), findsOneWidget);
      expect(find.text('Qty: 1'), findsOneWidget);
      expect(find.text('Qty: 3'), findsOneWidget);
      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('checkout button is shown only when items exist',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich);

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsOneWidget);

      // empty cart version:
      final emptyCart = Cart();

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: emptyCart)),
      );

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsNothing);
    });

    testWidgets('increment quantity button works', (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 1);

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Qty: 1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('Qty: 2'), findsOneWidget);
    });

    testWidgets('decrement quantity button works', (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Qty: 2'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('Qty: 1'), findsOneWidget);
    });

    testWidgets('remove item button works', (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      expect(find.text('Veggie Delight'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();

      expect(find.text('Veggie Delight'), findsNothing);
      expect(find.text('Your cart is empty.'), findsOneWidget);
    });

    testWidgets('Back to Order button exists and works',
        (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      final backButton = find.text('Back to Order');

      expect(backButton, findsOneWidget);
    });

    testWidgets('CartScreen shows logo in app bar',
        (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(
        MaterialApp(home: CartScreen(cart: cart)),
      );

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
      final Image logo = tester.widget(imageFinder.first);
      expect((logo.image as AssetImage).assetName, 'assets/images/logo.png');
    });
  });
}
