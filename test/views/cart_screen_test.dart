import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/app_styles.dart';

void main() {
  group('CartScreen', () {
    testWidgets('displays empty cart message when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();
      final CartScreen cartScreen = CartScreen(cart: emptyCart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays cart items when cart has items',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: true,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text(sandwich.name), findsOneWidget);
      final sizeLabel =
          '${sandwich.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich.breadType.name} bread';
      expect(find.text(sizeLabel), findsOneWidget);
      expect(find.text('${cart.getQuantity(sandwich)}'), findsOneWidget);
      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('displays multiple cart items correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: true,
      );
      final Sandwich sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        breadType: BreadType.wheat,
        isFootlong: false,
      );
      cart.add(sandwich1, quantity: 1);
      cart.add(sandwich2, quantity: 3);

      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text(sandwich1.name), findsOneWidget);
      expect(find.text(sandwich2.name), findsOneWidget);
      final sizeLabel1 =
          '${sandwich1.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich1.breadType.name} bread';
      final sizeLabel2 =
          '${sandwich2.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich2.breadType.name} bread';
      expect(find.text(sizeLabel1), findsOneWidget);
      expect(find.text(sizeLabel2), findsOneWidget);
      expect(find.text('${cart.getQuantity(sandwich1)}'), findsWidgets);
      expect(find.text('${cart.getQuantity(sandwich2)}'), findsWidgets);
      expect(find.textContaining('Total: £'), findsOneWidget);
    });

    testWidgets('back button navigates back', (WidgetTester tester) async {
      final Cart cart = Cart();
      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      // Find the back button by its text instead of StyledButton type
      final Finder backButtonFinder = find.text('Back to Order');
      expect(backButtonFinder, findsOneWidget);

      final TextButton backButton = tester.widget<TextButton>(find.ancestor(
        of: backButtonFinder,
        matching: find.byType(TextButton),
      ));
      expect(backButton.onPressed, isNotNull);
    });

    testWidgets('displays logo in app bar', (WidgetTester tester) async {
      final Cart cart = Cart();
      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      final appBarImagesFinder = find.descendant(
        of: appBarFinder,
        matching: find.byType(Image),
      );
      expect(appBarImagesFinder, findsOneWidget);

      final Image logoImage = tester.widget(appBarImagesFinder);
      expect(
          (logoImage.image as AssetImage).assetName, 'assets/images/logo.png');
    });

    testWidgets('CartScreen displays and modifies cart items',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: false,
      );
      cart.add(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      // Check initial quantity
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

      // Add again and clear cart
      cart.add(sandwich, quantity: 1);
      await tester.pump();

      // Tap the "Clear Cart" button by text, not by StyledButton type
      await tester.tap(find.text('Clear Cart'));
      await tester.pump();

      // Confirm dialog
      await tester.tap(find.text('Clear'));
      await tester.pump();

      expect(cart.items.isEmpty, true);
    });
  });
}
