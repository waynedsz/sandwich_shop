import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CartScreen', () {
    testWidgets('shows empty cart message when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();

      final app = createTestApp(const CartScreen(), cart: emptyCart);
      await tester.pumpWidget(app);

      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays single item in cart', (tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.addItem(sandwich, quantity: 2);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Qty: 2'), findsOneWidget);
      expect(find.text('£22.00'), findsOneWidget);
      expect(find.text('Total: £22.00'), findsOneWidget);
    });

    testWidgets('displays multiple cart items', (tester) async {
      final Cart cart = Cart();

      final sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      final sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.addItem(sandwich1, quantity: 1);
      cart.addItem(sandwich2, quantity: 3);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);

      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Six-inch on wheat bread'), findsOneWidget);

      expect(find.text('Qty: 1'), findsOneWidget);
      expect(find.text('Qty: 3'), findsOneWidget);

      expect(find.text('Total: £32.00'), findsOneWidget);
    });

    testWidgets('checkout button is visible when cart has items',
        (tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 1);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsOneWidget);
    });

    testWidgets('checkout button is hidden when cart is empty', (tester) async {
      final Cart cart = Cart();

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsNothing);
    });

    testWidgets('increment button increases quantity', (tester) async {
      final Cart cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 1);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Qty: 1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('Qty: 2'), findsOneWidget);
      expect(find.text('Quantity increased'), findsOneWidget);
    });

    testWidgets('decrement button decreases quantity', (tester) async {
      final Cart cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Qty: 2'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      expect(find.text('Qty: 1'), findsOneWidget);
      expect(find.text('Quantity decreased'), findsOneWidget);
    });

    testWidgets('delete button removes item', (tester) async {
      final Cart cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 2);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(find.text('Veggie Delight'), findsNothing);
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Item removed from cart'), findsOneWidget);
    });

    testWidgets('Back to Order button exists and is clickable', (tester) async {
      final Cart cart = Cart();
      final app = createTestApp(const CartScreen(), cart: cart);

      await tester.pumpWidget(app);

      testStyledButtonProperties(tester, 'Back to Order');
    });

    testWidgets('common app bar elements show correctly', (tester) async {
      final Cart cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 3);

      final app = createTestApp(const CartScreen(), cart: cart);
      await tester.pumpWidget(app);

      testCommonAppBarLogo(tester);
      testCartIndicator(tester, 3);
      testBasicScaffoldStructure(tester);
    });
  });
}
