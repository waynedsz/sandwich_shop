import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
<<<<<<< HEAD
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/app_styles.dart';
=======
import 'package:sandwich_shop/views/cart_screen.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)

void main() {
  group('CartScreen', () {
    testWidgets('displays empty cart message when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();
<<<<<<< HEAD
      final CartScreen cartScreen = CartScreen(cart: emptyCart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
=======
      final CartScreen cartViewScreen = CartScreen(cart: emptyCart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Your cart is empty.'), findsOneWidget);
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
      expect(find.text('Total: £0.00'), findsOneWidget);
    });

    testWidgets('displays cart items when cart has items',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
<<<<<<< HEAD
        breadType: BreadType.white,
        isFootlong: true,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text(sandwich.name), findsOneWidget);
      final sizeLabel =
          '${sandwich.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich.breadType.name} bread';
      expect(find.text(sizeLabel), findsOneWidget);
      expect(find.text('${cart.getQuantity(sandwich)}'), findsOneWidget);
      expect(find.textContaining('Total: £'), findsOneWidget);
=======
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Cart View'), findsOneWidget);
      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Qty: 2'), findsOneWidget);
      expect(find.text('£22.00'), findsOneWidget);
      expect(find.text('Total: £22.00'), findsOneWidget);
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
    });

    testWidgets('displays multiple cart items correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
<<<<<<< HEAD
        breadType: BreadType.white,
        isFootlong: true,
      );
      final Sandwich sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        breadType: BreadType.wheat,
        isFootlong: false,
=======
        isFootlong: true,
        breadType: BreadType.white,
      );
      final Sandwich sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
      );
      cart.add(sandwich1, quantity: 1);
      cart.add(sandwich2, quantity: 3);

<<<<<<< HEAD
      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      expect(find.text(sandwich1.name), findsOneWidget);
      expect(find.text(sandwich2.name), findsOneWidget);
      final sizeLabel1 =
          '${sandwich1.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich1.breadType.name} bread';
      final sizeLabel2 =
          '${sandwich2.isFootlong ? 'Footlong' : 'Six-inch'} on ${sandwich2.breadType.name} bread';
      expect(find.text(sizeLabel1), findsOneWidget);
      expect(find.text(sizeLabel2), findsOneWidget);
      expect(find.text('${cart.getQuantity(sandwich1)}'), findsWidgets);
      expect(find.text('${cart.getQuantity(sandwich2)}'), findsWidgets);
      expect(find.textContaining('Total: £'), findsOneWidget);
=======
      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Footlong on white bread'), findsOneWidget);
      expect(find.text('Six-inch on wheat bread'), findsOneWidget);
      expect(find.text('Qty: 1'), findsOneWidget);
      expect(find.text('Qty: 3'), findsOneWidget);
      expect(find.text('Total: £32.00'), findsOneWidget);
    });

    testWidgets('shows checkout button when cart has items',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 1);

      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsOneWidget);
    });

    testWidgets('hides checkout button when cart is empty',
        (WidgetTester tester) async {
      final Cart emptyCart = Cart();
      final CartScreen cartViewScreen = CartScreen(cart: emptyCart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.widgetWithText(StyledButton, 'Checkout'), findsNothing);
    });

    testWidgets('increment quantity button works correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 1);

      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Qty: 1'), findsOneWidget);

      final Finder addButtonFinder = find.byIcon(Icons.add);
      await tester.tap(addButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text('Qty: 2'), findsOneWidget);
      expect(find.text('Quantity increased'), findsOneWidget);
    });

    testWidgets('decrement quantity button works correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Qty: 2'), findsOneWidget);

      final Finder removeButtonFinder = find.byIcon(Icons.remove);
      await tester.tap(removeButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text('Qty: 1'), findsOneWidget);
      expect(find.text('Quantity decreased'), findsOneWidget);
    });

    testWidgets('remove item button works correctly',
        (WidgetTester tester) async {
      final Cart cart = Cart();
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.add(sandwich, quantity: 2);

      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      expect(find.text('Veggie Delight'), findsOneWidget);

      final Finder deleteButtonFinder = find.byIcon(Icons.delete);
      await tester.tap(deleteButtonFinder);
      await tester.pumpAndSettle();

      expect(find.text('Veggie Delight'), findsNothing);
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.text('Item removed from cart'), findsOneWidget);
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
    });

    testWidgets('back button navigates back', (WidgetTester tester) async {
      final Cart cart = Cart();
<<<<<<< HEAD
      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      // Find the back button by its text instead of StyledButton type
      final Finder backButtonFinder = find.text('Back to Order');
      expect(backButtonFinder, findsOneWidget);

      final TextButton backButton = tester.widget<TextButton>(find.ancestor(
        of: backButtonFinder,
        matching: find.byType(TextButton),
      ));
      expect(backButton.onPressed, isNotNull);
    });

    testWidgets('displays logo in app bar', (WidgetTester tester) async {
      final Cart cart = Cart();
      final CartScreen cartScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(
        home: cartScreen,
      );

      await tester.pumpWidget(app);

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      final appBarImagesFinder = find.descendant(
        of: appBarFinder,
        matching: find.byType(Image),
      );
      expect(appBarImagesFinder, findsOneWidget);

      final Image logoImage = tester.widget(appBarImagesFinder);
      expect(
          (logoImage.image as AssetImage).assetName, 'assets/images/logo.png');
    });

    testWidgets('CartScreen displays and modifies cart items',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.white,
        isFootlong: false,
      );
      cart.add(sandwich, quantity: 2);

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      // Check initial quantity
      expect(find.text('2'), findsOneWidget);

      // Tap + button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.add));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 3);

      // Tap - button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.remove));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 2);

      // Tap delete button
      await tester.tap(find.widgetWithIcon(IconButton, Icons.delete));
      await tester.pump();
      expect(cart.getQuantity(sandwich), 0);

      // Add again and clear cart
      cart.add(sandwich, quantity: 1);
      await tester.pump();

      // Tap the "Clear Cart" button by text, not by StyledButton type
      await tester.tap(find.text('Clear Cart'));
      await tester.pump();

      // Confirm dialog
      await tester.tap(find.text('Clear'));
      await tester.pump();

      expect(cart.items.isEmpty, true);
    });
=======
      final CartScreen cartViewScreen = CartScreen(cart: cart);
      final MaterialApp app = MaterialApp(home: cartViewScreen);

      await tester.pumpWidget(app);

      final Finder backButtonFinder =
          find.widgetWithText(StyledButton, 'Back to Order');
      expect(backButtonFinder, findsOneWidget);

      final StyledButton backButton =
          tester.widget<StyledButton>(backButtonFinder);
      expect(backButton.onPressed, isNotNull);
    });
>>>>>>> 759b22d (Standardize screen file naming: cart_view_screen -> cart_screen, order_screen_view -> order_screen)
  });
}
