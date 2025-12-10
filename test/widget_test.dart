import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/common_widgets.dart';
import 'package:sandwich_shop/views/order_screen.dart';

void main() {
  group('App loads correctly', () {
    testWidgets('App shows OrderScreen as home', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
      expect(find.text('Sandwich Counter'), findsOneWidget);
    });
  });

  group('OrderScreen – Quantity Controls', () {
    testWidgets('Initial state shows 0 sandwiches', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Increment quantity works', (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
    });

    testWidgets('Decrement quantity works', (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Does not go below zero', (tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Does not exceed maxQuantity', (tester) async {
      await tester.pumpWidget(const App());
      for (var i = 0; i < 10; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }
      expect(find.text('5 white footlong sandwich(es): 🥪🥪🥪🥪🥪'),
          findsOneWidget);
    });
  });

  group('OrderScreen – Controls (switch, dropdown, textfield)', () {
    testWidgets('Switch toggles footlong <-> six-inch', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.textContaining('footlong sandwich'), findsOneWidget);

      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(find.textContaining('six-inch sandwich'), findsOneWidget);
    });

    testWidgets('Bread dropdown changes bread type', (tester) async {
      await tester.pumpWidget(const App());

      await tester.tap(find.byType(DropdownMenu<BreadType>));
      await tester.pumpAndSettle();

      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();

      expect(find.textContaining('wheat footlong sandwich'), findsOneWidget);
    });

    testWidgets('Textfield updates note', (tester) async {
      await tester.pumpWidget(const App());

      final notesField = find.byKey(const Key('notes_textfield'));
      await tester.enterText(notesField, 'extra pickles');
      await tester.pump();

      expect(find.text('Note: extra pickles'), findsOneWidget);
    });
  });

  group('OrderItemDisplay widget', () {
    testWidgets('Shows correct display for 0 sandwiches', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OrderItemDisplay(
              quantity: 0,
              itemType: 'footlong',
              breadType: BreadType.white,
              orderNote: 'test note',
            ),
          ),
        ),
      );

      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      expect(find.text('Note: test note'), findsOneWidget);
    });

    testWidgets('Shows correct display for 3 sandwiches', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OrderItemDisplay(
              quantity: 3,
              itemType: 'footlong',
              breadType: BreadType.wheat,
              orderNote: 'another test note',
            ),
          ),
        ),
      );

      expect(
          find.text('3 wheat footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
      expect(find.text('Note: another test note'), findsOneWidget);
    });
  });

  group('OrderScreen – Cart interactions', () {
    testWidgets('Add to Cart increases cart summary', (tester) async {
      await tester.pumpWidget(const App());

      final addToCart = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);
    });

    testWidgets('Snackbar shows confirmation message', (tester) async {
      await tester.pumpWidget(const App());

      final addToCart = find.widgetWithText(StyledButton, 'Add to Cart');

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -500));
      await tester.pumpAndSettle();

      await tester.tap(addToCart);
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Added 1 footlong Veggie Delight sandwich(es) on white bread to cart',
        ),
        findsOneWidget,
      );
    });
  });

  group('StyledButton widget', () {
    testWidgets('Enabled StyledButton shows icon + text', (tester) async {
      const button = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test',
        backgroundColor: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: button)),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
