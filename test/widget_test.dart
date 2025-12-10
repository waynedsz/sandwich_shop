import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('App widget', () {
    testWidgets('App loads OrderScreen', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsOneWidget);
    });
  });

  group('OrderScreen – Quantity Controls', () {
    testWidgets('Quantity increments and decrements', (tester) async {
      await tester.pumpWidget(const App());

      // Scroll to make quantity buttons visible
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      // Increment
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Decrement
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Quantity never drops below 1', (tester) async {
      await tester.pumpWidget(const App());

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);

      // Try to decrement below 1
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });

  group('OrderScreen – Size Switch', () {
    testWidgets('Switch toggles six-inch / footlong', (tester) async {
      await tester.pumpWidget(const App());

      // The default is Footlong
      expect(find.textContaining('Footlong'), findsOneWidget);

      final sizeSwitch = find.byType(Switch);

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      await tester.tap(sizeSwitch);
      await tester.pump();

      expect(find.textContaining('Six-inch'), findsOneWidget);
    });
  });

  group('OrderScreen – StyledButton', () {
    testWidgets('StyledButton renders correctly', (tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Button',
        backgroundColor: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: testButton)),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Button'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('OrderItemDisplay', () {
    testWidgets('Displays quantity, bread and note', (tester) async {
      final item = OrderItemDisplay(
        quantity: 2,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'Hello',
      );

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: item)),
      );

      expect(find.text('2 white footlong sandwich(es): 🥪🥪'), findsOneWidget);
      expect(find.text('Note: Hello'), findsOneWidget);
    });
  });

  group('Cart functionality', () {
    testWidgets('Cart updates after adding a sandwich', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrderScreen()));

      // Cart starts at zero
      expect(find.textContaining('Cart: 0'), findsOneWidget);

      // Scroll down to show Add to Cart button
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -700),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Add to Cart'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Cart: 1'), findsOneWidget);
      expect(find.textContaining('Total: \$'), findsOneWidget);
    });
  });
}
