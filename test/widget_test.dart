<<<<<<< HEAD
<<<<<<< HEAD
// Flutter widget tests for the Sandwich Shop application.
//
// These tests confirm that the landing page renders the
// primary buttons and that tapping a button shows the
// placeholder SnackBar.

<<<<<<< HEAD
<<<<<<< HEAD
=======
import 'package:flutter/material.dart';
>>>>>>> dbe9ace (📝 Refactor widget_test.dart to improve order screen interaction tests and enhance clarity)
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
=======
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)
import 'package:flutter_test/flutter_test.dart';

>>>>>>> 816cadc (first commit)
=======
import 'package:flutter_test/flutter_test.dart';
>>>>>>> b59c018 (Update widget_test based on code in stage 2)
import 'package:sandwich_shop/main.dart';

// Test function for checking if the App widget correctly displays the OrderScreen.
// WidgetTester is a helper class from the flutter_test package.
// It provides methods to interact with widgets in a test environment.
// findsOneWidget is a matcher that checks if exactly one such widget is found.
Future<void> _testAppSetsOrderScreenAsHome(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  expect(find.byType(OrderScreen), findsOneWidget);
}

// Test function for verifying the initial UI state of the OrderScreen.
Future<void> _testInitialStateShowsZeroSandwiches(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
  expect(find.text('Sandwich Counter'), findsOneWidget);
}

// Test function for the 'Add' button functionality.
// tester.tap simulates a tap on the button.
Future<void> _testTappingAddButtonIncreasesQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
  await tester.pump();
  expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);
}

// Test function for the 'Remove' button functionality.
Future<void> _testTappingRemoveButtonDecreasesQuantity(
    WidgetTester tester) async {
  await tester.pumpWidget(const App());
  // First, add one to ensure there is something to remove.
  await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
  await tester.pump();
  expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);

  // Now, test the remove functionality.
  await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
  await tester.pump();
  expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
}

// Test function to ensure the quantity cannot go below zero.
Future<void> _testQuantityDoesNotGoBelowZero(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);

  // Attempt to remove from zero.
  await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
  await tester.pump();
  expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
}

// Test function to ensure the quantity does not exceed the maximum limit.
Future<void> _testQuantityDoesNotExceedMaxQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());
  // The maxQuantity is set to 5 in the App widget.
  // We tap 'Add' more than 5 times to test the limit.
  for (int i = 0; i < 10; i++) {
    await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
    await tester.pump();
  }
  expect(find.text('5 Footlong sandwich(es): 🥪🥪🥪🥪🥪'), findsOneWidget);
}

// Test function for OrderItemDisplay with zero quantity.
Future<void> _testOrderItemDisplayForZero(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(
    home: Scaffold(body: OrderItemDisplay(0, 'Footlong')),
  ));
  expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
}

// Test function for OrderItemDisplay with a non-zero quantity.
Future<void> _testOrderItemDisplayForThree(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(
    home: Scaffold(body: OrderItemDisplay(3, 'Footlong')),
  ));
  expect(find.text('3 Footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
}

void main() {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  /// Groups all landing‑page smoke tests.
  group('LandingPage smoke tests', () {
    /// Verifies that the two primary action buttons appear.
    testWidgets('Primary buttons are visible', (WidgetTester tester) async {
      const SandwichShopApp application = SandwichShopApp();
      await tester.pumpWidget(application);

<<<<<<< HEAD
<<<<<<< HEAD
    // Verify that our counter starts at 0 by checking the OrderItemDisplay text.
    expect(find.textContaining('0 Footlong'), findsOneWidget);
    expect(find.textContaining('1 Footlong'), findsNothing);

    // Tap the 'Add' button and trigger a frame.
    await tester.tap(find.text('Add'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.textContaining('0 Footlong'), findsNothing);
    expect(find.textContaining('1 Footlong'), findsOneWidget);
  });

  // This test verifies the functionality of the Switch widget that toggles between 'six-inch' and 'footlong'.
  // Switch widgets are toggled by tapping on them like buttons.
  testWidgets('Switch toggles between six-inch and footlong',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Find the Switch widget by key
    final switchFinder = find.byKey(const Key('sandwichTypeSwitch'));

    // Initially, OrderItemDisplay should show 'footlong'
    expect(find.textContaining('footlong'), findsOneWidget);
    expect(find.textContaining('six-inch'), findsNothing);

    // Tap the Switch to toggle to 'six-inch'
    await tester.tap(switchFinder);
    await tester.pump();

    // Now, OrderItemDisplay should show 'six-inch'
    expect(find.textContaining('six-inch'), findsOneWidget);
    expect(find.textContaining('footlong'), findsNothing);

    // Tap again to toggle back to 'footlong'
    await tester.tap(switchFinder);
    await tester.pump();

    // Should show 'footlong' again
    expect(find.textContaining('footlong'), findsOneWidget);
    expect(find.textContaining('six-inch'), findsNothing);
=======
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
=======
      final Finder selectMenuButton = find.text('Select from the menu');
      final Finder buildOwnButton = find.text('Build your own sandwich');
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)

      expect(selectMenuButton, findsOneWidget);
      expect(buildOwnButton, findsOneWidget);
    });

<<<<<<< HEAD
    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
>>>>>>> 816cadc (first commit)
=======
    /// Confirms that tapping a primary button shows the
    /// Feature coming soon SnackBar.
    testWidgets('Tapping primary button shows SnackBar', (
      WidgetTester tester,
    ) async {
      const SandwichShopApp application = SandwichShopApp();
      await tester.pumpWidget(application);

      final Finder selectMenuButton = find.text('Select from the menu');

      await tester.tap(selectMenuButton);
      await tester.pump(); // start SnackBar animation
      await tester.pump(const Duration(seconds: 1));

      final Finder snackBar = find.text('Feature coming soon…');

      expect(snackBar, findsOneWidget);
=======
  group('SandwichCounter smoke tests', () {
    testWidgets('Counter text is visible', (WidgetTester tester) async {
      await tester.pumpWidget(const SandwichShopApp());
      final Finder counterText = find.text(
        '5 Footlong sandwich(es): 🥪🥪🥪🥪🥪',
      );
      expect(counterText, findsOneWidget);
    });

    testWidgets('App bar title is visible', (WidgetTester tester) async {
      await tester.pumpWidget(const SandwichShopApp());
      final Finder titleText = find.text('Sandwich Counter');
      expect(titleText, findsOneWidget);
>>>>>>> b59c018 (Update widget_test based on code in stage 2)
=======
=======
  group('App widget', () {
    testWidgets('App sets OrderScreen as home', _testAppSetsOrderScreenAsHome);
  });

>>>>>>> 5035cac (📝 Update widget tests in widget_test.dart for improved functionality and coverage)
  group('OrderScreen interaction tests', () {
    testWidgets('Initial state shows 0 sandwiches',
        _testInitialStateShowsZeroSandwiches);
    testWidgets('Tapping add button increases quantity',
        _testTappingAddButtonIncreasesQuantity);
    testWidgets('Tapping remove button decreases quantity',
<<<<<<< HEAD
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Quantity does not go below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
>>>>>>> dbe9ace (📝 Refactor widget_test.dart to improve order screen interaction tests and enhance clarity)
    });
<<<<<<< HEAD
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)
=======

=======
        _testTappingRemoveButtonDecreasesQuantity);
    testWidgets(
        'Quantity does not go below zero', _testQuantityDoesNotGoBelowZero);
>>>>>>> 48ab550 (Simplify tests)
    testWidgets('Quantity does not exceed maxQuantity',
        _testQuantityDoesNotExceedMaxQuantity);
  });

  group('OrderItemDisplay widget', () {
<<<<<<< HEAD
    testWidgets('Displays correct text and emoji for 0',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: OrderItemDisplay(0, 'Footlong')),
      ));
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Displays correct text and emoji for 3',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(body: OrderItemDisplay(3, 'Footlong')),
      ));
      expect(find.text('3 Footlong sandwich(es): 🥪🥪🥪'), findsOneWidget);
    });
>>>>>>> 5035cac (📝 Update widget tests in widget_test.dart for improved functionality and coverage)
=======
    testWidgets(
        'Displays correct text and emoji for 0', _testOrderItemDisplayForZero);
    testWidgets(
        'Displays correct text and emoji for 3', _testOrderItemDisplayForThree);
>>>>>>> 48ab550 (Simplify tests)
  });
}
