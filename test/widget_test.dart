import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/views/order_screen.dart';

void main() {
  group('MyApp widget tests', () {
    testWidgets('MyApp loads OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(OrderScreen), findsOneWidget);
    });

    testWidgets('App title is applied correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));

      expect(materialApp.title, 'Sandwich Shop');
      expect(materialApp.debugShowCheckedModeBanner, false);
    });

    testWidgets('App theme is applied', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final MaterialApp materialApp = tester.widget(find.byType(MaterialApp));

      expect(materialApp.theme?.scaffoldBackgroundColor, Colors.white);

      final AppBarTheme appBarTheme =
          materialApp.theme!.appBarTheme as AppBarTheme;
      expect(appBarTheme.backgroundColor, Colors.green);
      expect(appBarTheme.foregroundColor, Colors.white);
    });

    testWidgets('OrderScreen initial UI renders basic elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Sandwich Counter'), findsOneWidget);

      expect(find.byType(Image), findsWidgets);

      final switchWidgets = find.byType(Switch);
      expect(switchWidgets, findsWidgets);
    });
  });
}
