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

/// Finds the specific [ElevatedButton] inside a [StyledButton] identified by its icon.
Finder _findElevatedButtonByIcon(IconData icon) {
  Finder styledButtonFinder = find.widgetWithIcon(StyledButton, icon);
  return find.descendant(
    of: styledButtonFinder,
    matching: find.byType(ElevatedButton),
  );
}

/// Tests if the [App] widget correctly displays the [OrderScreen] as its home.
///
/// This test pumps the [App] widget and verifies that exactly one [OrderScreen]
/// widget is found in the widget tree, confirming it's the initial screen.
Future<void> _testAppSetsOrderScreenAsHome(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder orderScreenFinder = find.byType(OrderScreen);
  expect(orderScreenFinder, findsOneWidget);
}

/// Verifies that the initial UI state of the [OrderScreen] is correct.
///
/// This test pumps the [App] widget and checks for three things:
/// 1. The text shows 0 sandwiches with the default bread and item type.
/// 2. The default note 'No notes added.' is visible.
/// 3. The app bar title 'Sandwich Counter' is displayed.
Future<void> _testInitialStateIsCorrect(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialQuantityFinder = find.text('0 white footlong sandwich(es): ');
  expect(initialQuantityFinder, findsOneWidget);

  Finder initialNoteFinder = find.text('Note: No notes added.');
  expect(initialNoteFinder, findsOneWidget);

  Finder appBarTitleFinder = find.text('Sandwich Counter');
  expect(appBarTitleFinder, findsOneWidget);
}

/// Tests the 'Add' button functionality to ensure it increases the quantity.
///
/// It pumps the [App] widget, finds the 'Add' button by its unique icon,
/// simulates a tap, and then rebuilds the widget tree. Finally, it verifies
/// that the quantity displayed on the screen has increased to 1.
Future<void> _testTappingAddButtonIncreasesQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  await tester.tap(addIconFinder);
  await tester.pump();

  Finder updatedQuantityFinder = find.text('1 white footlong sandwich(es): 🥪');
  expect(updatedQuantityFinder, findsOneWidget);
}

/// Tests the 'Remove' button functionality to ensure it decreases the quantity.
///
/// This test first taps the 'Add' button to increase the quantity to 1. It then
/// simulates a tap on the 'Remove' button and verifies that the quantity is
/// correctly decreased back to 0.
Future<void> _testTappingRemoveButtonDecreasesQuantity(
    WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  await tester.tap(addIconFinder);
  await tester.pump();

  Finder quantityOfOneFinder = find.text('1 white footlong sandwich(es): 🥪');
  expect(quantityOfOneFinder, findsOneWidget);

  Finder removeIconFinder = find.byIcon(Icons.remove);
  await tester.tap(removeIconFinder);
  await tester.pump();

  Finder quantityOfZeroFinder = find.text('0 white footlong sandwich(es): ');
  expect(quantityOfZeroFinder, findsOneWidget);
}

/// Ensures that the sandwich quantity cannot be decreased below zero.
///
/// The test starts with the initial state of 0 sandwiches. It then simulates
/// a tap on the 'Remove' button and verifies that the quantity remains at 0,
/// confirming the lower bound logic.
Future<void> _testQuantityDoesNotGoBelowZero(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialQuantityFinder = find.text('0 white footlong sandwich(es): ');
  expect(initialQuantityFinder, findsOneWidget);

  Finder removeIconFinder = find.byIcon(Icons.remove);
  await tester.tap(removeIconFinder);
  await tester.pump();

  expect(initialQuantityFinder, findsOneWidget);
}

/// Ensures that the sandwich quantity does not exceed the maximum limit.
///
/// The [App] widget is initialized with a `maxQuantity` of 5. This test
/// simulates tapping the 'Add' button 10 times and verifies that the quantity
/// displayed on the screen does not exceed 5.
Future<void> _testQuantityDoesNotExceedMaxQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  for (int i = 0; i < 10; i++) {
    await tester.tap(addIconFinder);
    await tester.pump();
  }

  Finder maxQuantityFinder =
      find.text('5 white footlong sandwich(es): 🥪🥪🥪🥪🥪');
  expect(maxQuantityFinder, findsOneWidget);
}

/// Verifies that the 'Remove' button is disabled when the quantity is zero.
///
/// This test checks the initial state, finds the underlying [ElevatedButton]
/// for the remove action, and asserts that its `onPressed` property is null,
/// which signifies it is disabled. It also confirms the 'Add' button is enabled.
Future<void> _testRemoveButtonIsDisabledAtZero(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder removeButtonFinder = _findElevatedButtonByIcon(Icons.remove);
  ElevatedButton removeButton =
      tester.widget<ElevatedButton>(removeButtonFinder);
  expect(removeButton.onPressed, isNull);

  Finder addButtonFinder = _findElevatedButtonByIcon(Icons.add);
  ElevatedButton addButton = tester.widget<ElevatedButton>(addButtonFinder);
  expect(addButton.onPressed, isNotNull);
}

/// Verifies that the 'Add' button is disabled when the max quantity is reached.
///
/// This test increments the quantity to its maximum limit of 5. It then finds
/// the underlying [ElevatedButton] for the add action and asserts that its
/// `onPressed` property is null. It also confirms the 'Remove' button is enabled.
Future<void> _testAddButtonIsDisabledAtMaxQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  for (int i = 0; i < 5; i++) {
    await tester.tap(addIconFinder);
    await tester.pump();
  }

  Finder addButtonFinder = _findElevatedButtonByIcon(Icons.add);
  ElevatedButton addButton = tester.widget<ElevatedButton>(addButtonFinder);
  expect(addButton.onPressed, isNull);

  Finder removeButtonFinder = _findElevatedButtonByIcon(Icons.remove);
  ElevatedButton removeButton =
      tester.widget<ElevatedButton>(removeButtonFinder);
  expect(removeButton.onPressed, isNotNull);
}

/// Verifies that the [Switch] correctly toggles the sandwich type.
///
/// This test finds the [Switch] widget, taps it, and confirms that the
/// displayed text in the [OrderItemDisplay] updates from 'footlong' to 'six-inch'.
Future<void> _testSwitchTogglesSandwichType(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialDisplayFinder = find.text('0 white footlong sandwich(es): ');
  expect(initialDisplayFinder, findsOneWidget);

  Finder switchFinder = find.byType(Switch);
  await tester.tap(switchFinder);
  await tester.pump();

  Finder updatedDisplayFinder = find.text('0 white six-inch sandwich(es): ');
  expect(updatedDisplayFinder, findsOneWidget);
}

/// Verifies that the [DropdownMenu] correctly changes the bread type.
///
/// This test finds and opens the [DropdownMenu], selects a new bread type ('wheat'),
/// and confirms that the displayed text in the [OrderItemDisplay] updates.
Future<void> _testDropdownChangesBreadType(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialDisplayFinder = find.text('0 white footlong sandwich(es): ');
  expect(initialDisplayFinder, findsOneWidget);

  Finder dropdownFinder = find.byType(DropdownMenu<BreadType>);
  await tester.tap(dropdownFinder);
  await tester.pumpAndSettle();

  Finder wheatMenuItemFinder = find.text('wheat').last;
  await tester.tap(wheatMenuItemFinder);
  await tester.pumpAndSettle();

  Finder updatedDisplayFinder = find.text('0 wheat footlong sandwich(es): ');
  expect(updatedDisplayFinder, findsOneWidget);
}

/// Verifies that entering text into the [TextField] updates the order note.
///
/// This test finds the [TextField], enters new text, and confirms that the
/// displayed note in the [OrderItemDisplay] updates accordingly.
Future<void> _testTextFieldUpdatesOrderNote(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialNoteFinder = find.text('Note: No notes added.');
  expect(initialNoteFinder, findsOneWidget);

  // Find the specific TextField using its unique key.
  Finder textFieldFinder = find.byKey(const Key('notes_textfield'));
  await tester.enterText(textFieldFinder, 'extra pickles');
  await tester.pump();

  Finder updatedNoteFinder = find.text('Note: extra pickles');
  expect(updatedNoteFinder, findsOneWidget);
  expect(initialNoteFinder, findsNothing);
}

/// Tests the [OrderItemDisplay] widget's output for a quantity of zero.
///
/// This test pumps only the [OrderItemDisplay] widget and verifies that it
/// correctly displays the text for zero items and the provided note.
Future<void> _testOrderItemDisplayForZero(WidgetTester tester) async {
  MaterialApp testApp = const MaterialApp(
    home: Scaffold(
      body: OrderItemDisplay(
        quantity: 0,
        itemType: 'footlong',
        breadType: BreadType.white,
        orderNote: 'test note',
      ),
    ),
  );
  await tester.pumpWidget(testApp);

  Finder zeroDisplayFinder = find.text('0 white footlong sandwich(es): ');
  expect(zeroDisplayFinder, findsOneWidget);

  Finder noteFinder = find.text('Note: test note');
  expect(noteFinder, findsOneWidget);
}

/// Tests the [OrderItemDisplay] widget's output for a non-zero quantity.
///
/// This test pumps the [OrderItemDisplay] widget with a quantity of 3 and
/// verifies that it correctly displays the text with emojis and the note.
Future<void> _testOrderItemDisplayForThree(WidgetTester tester) async {
  MaterialApp testApp = const MaterialApp(
    home: Scaffold(
      body: OrderItemDisplay(
        quantity: 3,
        itemType: 'footlong',
        breadType: BreadType.wheat,
        orderNote: 'another test note',
      ),
    ),
  );
  await tester.pumpWidget(testApp);

  Finder threeDisplayFinder =
      find.text('3 wheat footlong sandwich(es): 🥪🥪🥪');
  expect(threeDisplayFinder, findsOneWidget);

  Finder noteFinder = find.text('Note: another test note');
  expect(noteFinder, findsOneWidget);
}

/// The main entry point for running all widget tests.
void main() {
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
  // `group` allows organizing related tests together.
>>>>>>> 978ef25 (Add comments to widget_test)
=======
>>>>>>> f09a6e2 (Update widget test after completion of task 1)
  group('App widget', () {
    testWidgets('App sets OrderScreen as home', _testAppSetsOrderScreenAsHome);
  });

>>>>>>> 5035cac (📝 Update widget tests in widget_test.dart for improved functionality and coverage)
  group('OrderScreen interaction tests', () {
    testWidgets('Initial state is correct', _testInitialStateIsCorrect);
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
    testWidgets(
        'Remove button is disabled at zero', _testRemoveButtonIsDisabledAtZero);
    testWidgets('Add button is disabled at max quantity',
        _testAddButtonIsDisabledAtMaxQuantity);
    testWidgets('Switch toggles sandwich type', _testSwitchTogglesSandwichType);
    testWidgets(
        'Dropdown menu changes bread type', _testDropdownChangesBreadType);
    testWidgets(
        'Text field updates order note', _testTextFieldUpdatesOrderNote);
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
