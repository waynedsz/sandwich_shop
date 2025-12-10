import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('App loads correctly', () {
    testWidgets('App shows OrderScreen as home', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
      expect(find.text('Order Sandwiches'), findsOneWidget);
    });
  });

  group('OrderScreen – Quantity controls', () {
    testWidgets('initial quantity is 1', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('increment increases quantity', (tester) async {
      await tester.pumpWidget(const App());

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('decrement decreases quantity but not below 0', (tester) async {
      await tester.pumpWidget(const App());

      // Tap –
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);

      // Tap – again (should stay 0)
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });
  });

  group('OrderScreen – Sandwich options', () {
    testWidgets('switch toggles between six-inch and footlong', (tester) async {
      await tester.pumpWidget(const App());

      final switchFinder = find.byType(Switch);

      // Initially footlong (true)
      Switch sizeSwitch = tester.widget(switchFinder);
      expect(sizeSwitch.value, true);

      await tester.tap(switchFinder);
      await tester.pump();

      sizeSwitch = tester.widget(switchFinder);
      expect(sizeSwitch.value, false);
    });

    testWidgets('bread dropdown changes bread type', (tester) async {
      await tester.pumpWidget(const App());

      final breadDropdown = find.byType(DropdownButton<BreadType>);

      await tester.tap(breadDropdown);
      await tester.pumpAndSettle();

      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();

      expect(find.text('wheat'), findsWidgets);
    });

    testWidgets('sandwich type dropdown updates selection', (tester) async {
      await tester.pumpWidget(const App());

      await tester.tap(find.byType(DropdownButton<SandwichType>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Chicken Teriyaki').last);
      await tester.pumpAndSettle();

      expect(find.text('Chicken Teriyaki'), findsWidgets);
    });
  });

  group('OrderScreen – Cart logic', () {
    testWidgets('cart summary starts empty', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
    });

    testWidgets('adding to cart increases summary', (tester) async {
      await tester.pumpWidget(const App());

      final addToCartButton = find.text('Add to Cart');

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);
    });

    testWidgets('snackbar shows confirmation', (tester) async {
      await tester.pumpWidget(const App());

      final addToCartButton = find.text('Add to Cart');

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(
        find.text(
            'Added 1 footlong Veggie Delight sandwich(es) on white bread to cart'),
        findsOneWidget,
      );
    });
  });

  group('StyledButton', () {
    testWidgets('StyledButton renders correctly when enabled', (tester) async {
      const button = StyledButton(
        onPressed: null,
        icon: Icons.shopping_cart,
        label: 'Test',
        backgroundColor: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: button)),
      );

      expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
