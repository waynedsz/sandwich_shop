import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';

void main() {
  group('CartScreen', () {
    testWidgets('displays empty cart message when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: emptyCart),
        ),
      );

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays cart items when cart has items',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: true,
      );

      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text(sandwich.name), findsOneWidget);

      final sizeLabel =
          '${sandwich.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich.breadType.name} bread';

      expect(find.text(sizeLabel), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('displays multiple cart items correctly',
        (WidgetTester tester) async {
      final cart = Cart();

      final sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: true,
      );

      final sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        breadType: BreadType.wheat,
        isFootlong: false,
      );

      cart.addItem(sandwich1, quantity: 1);
      cart.addItem(sandwich2, quantity: 3);

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      expect(find.text(sandwich1.name), findsOneWidget);
      expect(find.text(sandwich2.name), findsOneWidget);

      final size1 =
          '${sandwich1.isFootlong ? "Footlong" : "Six-inch"} on ${sandwich1.breadType.name} bread';
      final size2 =
          '${sandwich2.isFootlong ? "Footlong" : "Six-inch"} on ${sandwich2.breadType.name} bread';

      expect(find.text(size1), findsOneWidget);
      expect(find.text(size2), findsOneWidget);

      expect(find.text('1'), findsWidgets);
      expect(find.text('3'), findsWidgets);

      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('back button navigates back', (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      // Back button text
      final Finder backButton = find.text('Back to Order');

      expect(backButton, findsOneWidget);

      final TextButton widgetButton = tester.widget(
          find.ancestor(of: backButton, matching: find.byType(TextButton)));

      expect(widgetButton.onPressed, isNotNull);
    });

    testWidgets('displays logo in app bar', (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      final Finder appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      final Finder logoFinder = find.descendant(
        of: appBarFinder,
        matching: find.byType(Image),
      );

      expect(logoFinder, findsOneWidget);

      final Image logoImage = tester.widget(logoFinder);
      expect(
        (logoImage.image as AssetImage).assetName,
        'assets/images/logo.png',
      );
    });

    testWidgets('CartScreen allows increment, decrement, delete, and clear',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: false,
      );

      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      // Initial quantity
      expect(find.text('2'), findsOneWidget);

      // Tap + button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 3);

      // Tap - button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.remove));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 2);

      // Tap delete button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.delete));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 0);

      // Add again so we can clear
      cart.addItem(sandwich, quantity: 1);
      await tester.pump();

      // Tap Clear Cart button
      await tester.tap(find.text('Clear Cart'));
      await tester.pumpAndSettle();

      // Confirm dialog
      await tester.tap(find.text('Clear'));
      await tester.pump();

      expect(cart.items.isEmpty, true);
    });
  });
}
