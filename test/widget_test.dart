<<<<<<< HEAD
// Flutter widget tests for the Sandwich Shop application.
//
// These tests confirm that the landing page renders the
// primary buttons and that tapping a button shows the
// placeholder SnackBar.

<<<<<<< HEAD
<<<<<<< HEAD
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
import 'package:flutter/material.dart';

void main() {
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
      await tester.pumpWidget(SandwichShopApp());
      final Finder counterText = find.text(
        '5 Footlong sandwich(es): 🥪🥪🥪🥪🥪',
      );
      expect(counterText, findsOneWidget);
    });

    testWidgets('App bar title is visible', (WidgetTester tester) async {
      await tester.pumpWidget(SandwichShopApp());
      final Finder titleText = find.text('Sandwich Counter');
      expect(titleText, findsOneWidget);
>>>>>>> b59c018 (Update widget_test based on code in stage 2)
    });
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)
  });
}
