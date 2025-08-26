<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';
>>>>>>> dbe9ace (📝 Refactor widget_test.dart to improve order screen interaction tests and enhance clarity)
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD
<<<<<<< HEAD
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
<<<<<<< HEAD
=======
import 'package:sandwich_shop/views/main.dart';
>>>>>>> cdd80e0 (Move UIs to views)
=======
import 'package:sandwich_shop/main.dart';
>>>>>>> 816369a (Move main.dart back to lib and update references)
=======
import 'package:sandwich_shop/models/sandwich.dart';
>>>>>>> 1f0aba9 (update widget_tests and main.dart)

/// Tests if the [App] widget correctly displays the [OrderScreen] as its home.
///
/// This test pumps the [App] widget and verifies that exactly one [OrderScreen]
/// widget is found in the widget tree, confirming it's the initial screen.
Future<void> _testAppSetsOrderScreenAsHome(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder orderScreenFinder = find.byType(OrderScreen);
  expect(orderScreenFinder, findsOneWidget);
}

/// Verifies that the initial UI state of the [OrderScreen] shows zero sandwiches.
///
/// This test pumps the [App] widget and checks for two things:
/// 1. The text '0 Footlong sandwich(es): ' is present, indicating the initial
///    quantity is zero.
/// 2. The app bar title 'Sandwich Counter' is displayed.
Future<void> _testInitialStateShowsZeroSandwiches(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialQuantityFinder = find.text('0 Footlong sandwich(es): ');
  expect(initialQuantityFinder, findsOneWidget);

  Finder appBarTitleFinder = find.text('Sandwich Counter');
  expect(appBarTitleFinder, findsOneWidget);
}

/// Tests the 'Add' button functionality to ensure it increases the quantity.
///
/// It pumps the [App] widget, finds the 'Add' button by its unique icon,
/// simulates a tap using [tester.tap], and then rebuilds the widget tree with
/// [tester.pump]. Finally, it verifies that the quantity displayed on the
/// screen has increased to 1.
Future<void> _testTappingAddButtonIncreasesQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  await tester.tap(addIconFinder);
  await tester.pump();

  Finder updatedQuantityFinder = find.text('1 Footlong sandwich(es): 🥪');
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

  Finder quantityOfOneFinder = find.text('1 Footlong sandwich(es): 🥪');
  expect(quantityOfOneFinder, findsOneWidget);

  Finder removeIconFinder = find.byIcon(Icons.remove);
  await tester.tap(removeIconFinder);
  await tester.pump();

  Finder quantityOfZeroFinder = find.text('0 Footlong sandwich(es): ');
  expect(quantityOfZeroFinder, findsOneWidget);
}

/// Ensures that the sandwich quantity cannot be decreased below zero.
///
/// The test starts with the initial state of 0 sandwiches. It then simulates
/// a tap on the 'Remove' button and verifies that the quantity remains at 0,
/// confirming the lower bound logic.
Future<void> _testQuantityDoesNotGoBelowZero(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder initialQuantityFinder = find.text('0 Footlong sandwich(es): ');
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
/// displayed on the screen does not exceed 5, confirming the upper bound logic.
Future<void> _testQuantityDoesNotExceedMaxQuantity(WidgetTester tester) async {
  await tester.pumpWidget(const App());

  Finder addIconFinder = find.byIcon(Icons.add);
  for (int i = 0; i < 10; i++) {
    await tester.tap(addIconFinder);
    await tester.pump();
  }

  Finder maxQuantityFinder = find.text('5 Footlong sandwich(es): 🥪🥪🥪🥪🥪');
  expect(maxQuantityFinder, findsOneWidget);
}

/// Tests the [OrderItemDisplay] widget's output for a quantity of zero.
///
/// This test pumps only the [OrderItemDisplay] widget with a quantity of 0
/// and verifies that it correctly displays the text for zero items.
Future<void> _testOrderItemDisplayForZero(WidgetTester tester) async {
  MaterialApp testApp = const MaterialApp(
    home: Scaffold(body: OrderItemDisplay(0, 'Footlong')),
  );
  await tester.pumpWidget(testApp);

  Finder zeroDisplayFinder = find.text('0 Footlong sandwich(es): ');
  expect(zeroDisplayFinder, findsOneWidget);
}

/// Tests the [OrderItemDisplay] widget's output for a non-zero quantity.
///
/// This test pumps the [OrderItemDisplay] widget with a quantity of 3 and
/// verifies that it correctly displays the text along with three sandwich emojis.
Future<void> _testOrderItemDisplayForThree(WidgetTester tester) async {
  MaterialApp testApp = const MaterialApp(
    home: Scaffold(body: OrderItemDisplay(3, 'Footlong')),
  );
  await tester.pumpWidget(testApp);

  Finder threeDisplayFinder = find.text('3 Footlong sandwich(es): 🥪🥪🥪');
  expect(threeDisplayFinder, findsOneWidget);
}

/// The main entry point for running all widget tests.
void main() {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
    testWidgets('App sets OrderScreen as home', (WidgetTester tester) async {
=======
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
>>>>>>> ede0ffc (Restructure widget_test.dart at 4)
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
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

=======
        _testTappingRemoveButtonDecreasesQuantity);
    testWidgets(
        'Quantity does not go below zero', _testQuantityDoesNotGoBelowZero);
>>>>>>> 48ab550 (Simplify tests)
    testWidgets('Quantity does not exceed maxQuantity',
        _testQuantityDoesNotExceedMaxQuantity);
  });

  group('OrderItemDisplay widget', () {
    testWidgets(
        'Displays correct text and emoji for 0', _testOrderItemDisplayForZero);
    testWidgets(
        'Displays correct text and emoji for 3', _testOrderItemDisplayForThree);
  });

<<<<<<< HEAD
>>>>>>> 5035cac (📝 Update widget tests in widget_test.dart for improved functionality and coverage)
  group('OrderScreen interaction tests', () {
    testWidgets(
        '"Sandwich Counter" text and initial sandwich quantity are displayed',
=======
  group('OrderScreen - Quantity', () {
    testWidgets('shows initial quantity and title',
>>>>>>> ede0ffc (Restructure widget_test.dart at 4)
        (WidgetTester tester) async {
=======
  testWidgets('App loads OrderScreen', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(OrderScreen), findsOneWidget);
    expect(find.text('Sandwich Counter'), findsOneWidget);
  });

  group('OrderScreen UI', () {
    testWidgets('quantity increments and decrements', (tester) async {
>>>>>>> f01f498 (fix widget_test.dart errors)
      await tester.pumpWidget(const App());

<<<<<<< HEAD
<<<<<<< HEAD
    testWidgets('Tapping add button increases quantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      // Rebuild the widget after the state has changed.
      await tester.pump();
      expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);
    });

    testWidgets('Tapping remove button decreases quantity',
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 271729f (Refactor widget tests to use inline functions)
=======
    testWidgets('increments quantity when Add is tapped',
>>>>>>> ede0ffc (Restructure widget_test.dart at 4)
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
<<<<<<< HEAD
<<<<<<< HEAD
      expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
=======
      // Verify the quantity is increased to 1.
      expect(find.text('1 Footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      // Verify the quantity is decreased back to 0.
>>>>>>> 271729f (Refactor widget tests to use inline functions)
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('Quantity does not go below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
<<<<<<< HEAD
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
=======
      // Verify the initial quantity is 0.
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      // Verify the quantity remains at 0, as it shouldn't go negative.
      expect(find.text('0 Footlong sandwich(es): '), findsOneWidget);
    });

>>>>>>> 271729f (Refactor widget tests to use inline functions)
    testWidgets('Quantity does not exceed maxQuantity',
=======
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
    });

    testWidgets('decrements quantity when Remove is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
      await tester.pump();
      expect(find.text('1 white footlong sandwich(es): 🥪'), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not decrement below zero', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
      await tester.tap(find.widgetWithText(ElevatedButton, 'Remove'));
      await tester.pump();
      expect(find.text('0 white footlong sandwich(es): '), findsOneWidget);
    });

    testWidgets('does not increment above maxQuantity',
>>>>>>> ede0ffc (Restructure widget_test.dart at 4)
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      for (int i = 0; i < 10; i++) {
        await tester.tap(find.widgetWithText(ElevatedButton, 'Add'));
        await tester.pump();
      }
      expect(find.text('5 white footlong sandwich(es): 🥪🥪🥪🥪🥪'),
          findsOneWidget);
    });
  });

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
  group('Group of tests for the OrderItemDisplay widget', () {
    // Check the OrderItemDisplay widgets in isolation.
    testWidgets('Displays the correct text for 0 sandwiches',
=======
  group('OrderScreen - Controls', () {
<<<<<<< HEAD
<<<<<<< HEAD
    testWidgets('toggles sandwich type with Switch',
>>>>>>> ede0ffc (Restructure widget_test.dart at 4)
=======
    testWidgets('toggles sandwich type with Switch',
>>>>>>> 28dddcb (📝 Add test for toggling sandwich type in OrderScreen)
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.textContaining('footlong sandwich'), findsOneWidget);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(find.textContaining('six-inch sandwich'), findsOneWidget);
    });
<<<<<<< HEAD

=======
>>>>>>> 175f964 (Prepare widget test for exercises)
=======
>>>>>>> 28dddcb (📝 Add test for toggling sandwich type in OrderScreen)
    testWidgets('changes bread type with DropdownMenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      await tester.tap(find.byType(DropdownMenu<BreadType>));
=======
      expect(find.text('1'), findsOneWidget);

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -200));
>>>>>>> f01f498 (fix widget_test.dart errors)
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('size switch toggles', (tester) async {
      await tester.pumpWidget(const App());

      expect(find.text('Footlong'), findsOneWidget);

      final sizeSwitch = find.byType(Switch);

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();

      await tester.tap(sizeSwitch);
      await tester.pump();

      expect(find.text('Six-inch'), findsOneWidget);
    });
  });

  group('StyledButton', () {
    testWidgets('renders icon and label', (tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: testButton)),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });

  group('OrderItemDisplay', () {
    testWidgets('renders quantity and note', (tester) async {
      const item = OrderItemDisplay(
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
>>>>>>> 271729f (Refactor widget tests to use inline functions)
  });

  testWidgets('cart updates after adding to cart', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: OrderScreen()));

    expect(find.textContaining('Cart: 0'), findsOneWidget);

    final addBtn = find.widgetWithText(ElevatedButton, 'Add to Cart');

    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();

    await tester.tap(addBtn);
    await tester.pumpAndSettle();

    expect(find.textContaining('Cart: 1'), findsOneWidget);
    expect(find.textContaining('Total: \$'), findsOneWidget);
=======
// This is a basic Flutter widget test.
=======
// Flutter widget tests for the Sandwich Shop application.
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)
//
// These tests confirm that the landing page renders the
// primary buttons and that tapping a button shows the
// placeholder SnackBar.

=======
>>>>>>> b59c018 (Update widget_test based on code in stage 2)
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  group('SandwichCounter smoke tests', () {
    testWidgets('Counter text is visible', (WidgetTester tester) async {
      await tester.pumpWidget(const SandwichShopApp());
      final Finder counterText = find.text(
        '5 Footlong sandwich(es): 🥪🥪🥪🥪🥪',
      );
      expect(counterText, findsOneWidget);
    });

<<<<<<< HEAD
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
    testWidgets('App bar title is visible', (WidgetTester tester) async {
      await tester.pumpWidget(const SandwichShopApp());
      final Finder titleText = find.text('Sandwich Counter');
      expect(titleText, findsOneWidget);
>>>>>>> b59c018 (Update widget_test based on code in stage 2)
    });
>>>>>>> 26da1cf (📝 Update widget tests for Sandwich Shop application)
  });
}
