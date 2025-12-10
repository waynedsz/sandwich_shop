import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:provider/provider.dart';

void main() {
  group('CheckoutScreen', () {
    testWidgets('displays order summary with empty cart',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(
                  cart: Provider.of<Cart>(context, listen: false)),
            ),
          ),
        ),
      );

      expect(find.text('Checkout'), findsOneWidget);
      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
      expect(find.text('Payment Method: Card ending in 1234'), findsOneWidget);
      expect(find.text('Confirm Payment'), findsOneWidget);
    });

    testWidgets('displays order summary with single item',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.addItem(sandwich, quantity: 2);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('2x Veggie Delight'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('displays order summary with multiple items',
        (WidgetTester tester) async {
      final cart = Cart();

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

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.text('3x Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Total:'), findsOneWidget);
    });

    testWidgets('shows confirm payment button initially',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(
                  cart: Provider.of<Cart>(context, listen: false)),
            ),
          ),
        ),
      );

      expect(find.text('Confirm Payment'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Processing payment...'), findsNothing);
    });

    testWidgets('shows processing state when payment is initiated',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.addItem(sandwich, quantity: 1);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Confirm Payment'));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Processing payment...'), findsOneWidget);
      expect(find.text('Confirm Payment'), findsNothing);

      await tester.pumpAndSettle();
    });

    testWidgets('calculates item prices correctly for footlong sandwiches',
        (WidgetTester tester) async {
      final cart = Cart();

      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(footlong, quantity: 1);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.textContaining('£11.00'), findsWidgets);
    });

    testWidgets('calculates item prices correctly for six-inch sandwiches',
        (WidgetTester tester) async {
      final cart = Cart();

      final six = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.white,
      );

      cart.addItem(six, quantity: 1);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.textContaining('£7.00'), findsWidgets);
    });

    testWidgets('displays correct total for mixed sandwich sizes',
        (WidgetTester tester) async {
      final cart = Cart();

      final footlong = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      final six = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.addItem(footlong, quantity: 1);
      cart.addItem(six, quantity: 2);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('1x Veggie Delight'), findsOneWidget);
      expect(find.text('2x Chicken Teriyaki'), findsOneWidget);
      expect(find.textContaining('£25.00'), findsWidgets);
    });

    testWidgets('has proper layout structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(
                  cart: Provider.of<Cart>(context, listen: false)),
            ),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('payment method text is centered', (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>(
          create: (_) => Cart(),
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(
                  cart: Provider.of<Cart>(context, listen: false)),
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(
        find.text('Payment Method: Card ending in 1234'),
      );

      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('order summary rows aligned with spaceBetween',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 1);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      final rows = tester.widgetList<Row>(find.byType(Row)).toList();
      final itemRow = rows.firstWhere(
        (r) => r.mainAxisAlignment == MainAxisAlignment.spaceBetween,
      );

      expect(itemRow.mainAxisAlignment, MainAxisAlignment.spaceBetween);
    });

    testWidgets('displays divider between items and total',
        (WidgetTester tester) async {
      final cart = Cart();

      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      cart.addItem(sandwich, quantity: 1);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('shows correct quantity/name formatting',
        (WidgetTester tester) async {
      final cart = Cart();

      final sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );

      cart.addItem(sandwich, quantity: 3);

      await tester.pumpWidget(
        ChangeNotifierProvider<Cart>.value(
          value: cart,
          child: MaterialApp(
            home: Builder(
              builder: (context) => CheckoutScreen(cart: cart),
            ),
          ),
        ),
      );

      expect(find.text('3x Chicken Teriyaki'), findsOneWidget);
    });
  });
}
