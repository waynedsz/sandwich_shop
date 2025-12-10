import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('OrderScreen - Initial State', () {
    testWidgets('displays the initial UI elements correctly',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Sandwich Counter'), findsOneWidget);

      // Two images → logo + sandwich
      expect(find.byType(Image), findsNWidgets(2));

      // Default sandwich type is Veggie Delight
      expect(find.text('Veggie Delight'), findsWidgets);

      // Six inch / footlong switch defaults to footlong (true)
      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, isTrue);

      // Default bread type: white
      expect(find.text('white'), findsWidgets);

      // Default quantity is 1
      expect(find.text('1'), findsOneWidget);

      // All primary buttons exist
      expect(find.widgetWithText(StyledButton, 'Add to Cart'), findsOneWidget);
      expect(find.widgetWithText(StyledButton, 'View Cart'), findsOneWidget);
      expect(find.widgetWithText(StyledButton, 'Profile'), findsOneWidget);
      expect(find.widgetWithText(StyledButton, 'Settings'), findsOneWidget);
      expect(
          find.widgetWithText(StyledButton, 'Order History'), findsOneWidget);
    });

    testWidgets('displays cart indicator in app bar',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      testCartIndicator(tester, 0);
    });
  });

  group('OrderScreen - Cart Summary', () {
    testWidgets('displays initial cart summary with zero items and price',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
    });

    testWidgets('updates cart summary when items are added to cart',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);
    });

    testWidgets('updates cart summary when quantity is increased',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      final addIcon = find.byIcon(Icons.add);
      await tester.tap(addIcon);
      await tester.pumpAndSettle();
      await tester.tap(addIcon);
      await tester.pumpAndSettle();

      final addToCart = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 3 items - £33.00'), findsOneWidget);
    });

    testWidgets('cart summary accumulates multiple adds',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      final addToCart = find.widgetWithText(StyledButton, 'Add to Cart');
      final addIcon = find.byIcon(Icons.add);

      // First add: qty=1
      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);

      // Increase quantity to 2, then add again
      await tester.tap(addIcon);
      await tester.pumpAndSettle();

      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 3 items - £33.00'), findsOneWidget);
    });

    testWidgets('updates app bar cart indicator when items added',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      testCartIndicator(tester, 0);

      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pumpAndSettle();

      testCartIndicator(tester, 1);
    });
  });

  group('OrderScreen - Interactions', () {
    testWidgets('shows SnackBar when item is added',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.widgetWithText(StyledButton, 'Add to Cart'));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Added 1 footlong Veggie Delight sandwich(es) on white bread to cart',
        ),
        findsOneWidget,
      );
    });

    testWidgets('updates sandwich type when selecting new option',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.byType(DropdownMenu<SandwichType>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Chicken Teriyaki').last);
      await tester.pumpAndSettle();

      expect(find.text('Chicken Teriyaki'), findsWidgets);
    });

    testWidgets('toggles size switch', (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.byType(Switch));
      await tester.pump();

      final sw = tester.widget<Switch>(find.byType(Switch));
      expect(sw.value, isFalse);
    });

    testWidgets('updates bread type when new option selected',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();

      expect(find.text('wheat'), findsWidgets);
    });

    testWidgets('increments quantity', (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('decrements quantity', (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('quantity cannot go below zero and Add to Cart disables',
        (WidgetTester tester) async {
      final cart = Cart();
      const orderScreen = OrderScreen();

      final app = createTestApp(orderScreen, cart: cart);
      await tester.pumpWidget(app);

      final remove = find.byIcon(Icons.remove);
      await tester.tap(remove);
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNWidgets(2));

      final StyledButton addBtn =
          tester.widget(find.widgetWithText(StyledButton, 'Add to Cart'));

      expect(addBtn.onPressed, isNull);
    });

    testWidgets('View Cart button is enabled', (WidgetTester tester) async {
      const orderScreen = OrderScreen();
      final app = createTestApp(orderScreen, cart: Cart());
      await tester.pumpWidget(app);

      final btn = tester
          .widget<StyledButton>(find.widgetWithText(StyledButton, 'View Cart'));

      expect(btn.onPressed, isNotNull);
    });

    testWidgets('Profile button is enabled', (WidgetTester tester) async {
      const orderScreen = OrderScreen();
      final app = createTestApp(orderScreen, cart: Cart());
      await tester.pumpWidget(app);

      final btn = tester
          .widget<StyledButton>(find.widgetWithText(StyledButton, 'Profile'));

      expect(btn.onPressed, isNotNull);
    });

    testWidgets('Settings button is enabled', (WidgetTester tester) async {
      const orderScreen = OrderScreen();
      final app = createTestApp(orderScreen, cart: Cart());
      await tester.pumpWidget(app);

      final btn = tester
          .widget<StyledButton>(find.widgetWithText(StyledButton, 'Settings'));

      expect(btn.onPressed, isNotNull);
    });

    testWidgets('Order History button is enabled', (WidgetTester tester) async {
      const orderScreen = OrderScreen();
      final app = createTestApp(orderScreen, cart: Cart());
      await tester.pumpWidget(app);

      final btn = tester.widget<StyledButton>(
          find.widgetWithText(StyledButton, 'Order History'));

      expect(btn.onPressed, isNotNull);
    });
  });
}
