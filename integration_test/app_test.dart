import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sandwich_shop/main.dart' as app;
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/widgets/common_widgets.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('add a sandwich to the cart and verify it is in the cart',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Test the initial state of the app (on the order screen)
      expect(find.text('Sandwich Counter'), findsOneWidget);
      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsWidgets);

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton); // Scroll if needed
      await tester.pumpAndSettle();

      // Add a sandwich to the cart
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      // Verify cart summary updated
      expect(find.text('Cart: 1 items - £11.00'), findsOneWidget);

      // Find the View Cart button to navigate to the cart
      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.pumpAndSettle();
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      // Verify that we're on the cart screen and the sandwich is there
      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Total: £11.00'), findsOneWidget);
    });

    testWidgets('change sandwich type and add to cart',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final sandwichDropdown = find.byType(DropdownMenu<SandwichType>);
      await tester.tap(sandwichDropdown);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Chicken Teriyaki').last);
      await tester.pumpAndSettle();

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.pumpAndSettle();

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.pumpAndSettle();

      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);
    });

    testWidgets('modify quantity and add to cart', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final quantitySection = find.text('Quantity: ');
      expect(quantitySection, findsOneWidget);

      // Find the + button that's near the quantity text
      final addButtons = find.byIcon(Icons.add);
      // The + button should be the first one (before the cart + button)
      final quantityAddButton = addButtons.first;

      await tester.tap(quantityAddButton);
      await tester.pumpAndSettle();
      await tester.tap(quantityAddButton);
      await tester.pumpAndSettle();

      expect(find.text('3'), findsOneWidget);

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.pumpAndSettle();

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      expect(find.text('Cart: 3 items - £33.00'), findsOneWidget);
    });

    testWidgets('complete checkout flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final addToCartButton = find.widgetWithText(StyledButton, 'Add to Cart');
      await tester.ensureVisible(addToCartButton);
      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();

      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();

      final checkoutButton = find.widgetWithText(StyledButton, 'Checkout');
      await tester.tap(checkoutButton);
      await tester.pumpAndSettle();

      expect(find.text('Checkout'), findsOneWidget);
      expect(find.text('Order Summary'), findsOneWidget);

      final confirmPaymentButton = find.text('Confirm Payment');
      await tester.tap(confirmPaymentButton);
      await tester.pumpAndSettle();

      // Wait for payment processing (2 seconds + buffer)
      await tester.pump(const Duration(seconds: 3));

      // Should be back on order screen with empty cart
      expect(find.text('Sandwich Counter'), findsOneWidget);
      expect(find.text('Cart: 0 items - £0.00'), findsOneWidget);
    });

    // Additional integration test stubs for thorough coverage:

    testWidgets('browse sandwiches - empty list edge case',
        (WidgetTester tester) async {
      // Simulate no sandwiches available by overriding the Sandwich list provider
      app.main();
      await tester.pumpAndSettle();

      // Ideally, you would inject a mock or override the provider here.
      // For demonstration, we'll check for the empty state message if no sandwiches are present.
      // If your app supports dependency injection, use it to provide an empty list.

      // Check for empty state message (update the text as per your UI)
      expect(find.textContaining('No sandwiches available'), findsOneWidget);
    });

    testWidgets('add unavailable sandwich - error scenario',
        (WidgetTester tester) async {
      // TODO: Simulate trying to add a sandwich that is out of stock/unavailable
      // Verify error message is shown
    });

    testWidgets('view empty cart', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final viewCartButton = find.widgetWithText(StyledButton, 'View Cart');
      await tester.ensureVisible(viewCartButton);
      await tester.tap(viewCartButton);
      await tester.pumpAndSettle();
      // Verify empty cart message
      expect(find.textContaining('empty'), findsOneWidget);
    });

    testWidgets('checkout with missing info - error scenario',
        (WidgetTester tester) async {
      // TODO: Simulate checkout with missing required info (e.g., address)
      // Verify error message is shown
    });

    testWidgets('payment failure during checkout', (WidgetTester tester) async {
      // TODO: Simulate payment failure and verify error handling
    });

    testWidgets('view order history - no past orders',
        (WidgetTester tester) async {
      // TODO: Simulate user with no past orders and verify empty state
    });

    testWidgets('view order history - with past orders',
        (WidgetTester tester) async {
      // TODO: Simulate user with past orders and verify they are displayed
    });

    testWidgets('update profile/settings - happy path',
        (WidgetTester tester) async {
      // TODO: Simulate updating profile/settings successfully
    });

    testWidgets('update profile/settings - error scenario',
        (WidgetTester tester) async {
      // TODO: Simulate invalid input or save failure and verify error message
    });

    testWidgets('save and reorder - happy path', (WidgetTester tester) async {
      // TODO: Simulate saving an order and reordering successfully
    });

    testWidgets('save and reorder - unavailable order',
        (WidgetTester tester) async {
      // TODO: Simulate trying to reorder a saved order that is now unavailable
      // Verify error message is shown
    });

    testWidgets('navigation edge cases', (WidgetTester tester) async {
      // TODO: Simulate rapid navigation, back button, and verify app stability
    });
  });
}
