import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';

void main() {
  testWidgets('Drawer is available on small screens',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final menuButton = find.byTooltip('Open navigation menu');
    expect(menuButton, findsOneWidget);
    await tester.tap(menuButton);
    await tester.pumpAndSettle();

    expect(find.byType(Drawer), findsOneWidget);
    expect(find.byKey(const Key('drawer_nav_about')), findsOneWidget);
    expect(find.byKey(const Key('drawer_nav_profile')), findsOneWidget);
  });

  testWidgets('NavigationRail is available on wide screens',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1000, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
  });

  testWidgets('Tapping drawer item navigates to About screen',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('drawer_nav_about')));
    await tester.pumpAndSettle();

    expect(find.text('About'), findsOneWidget);
  });
}
