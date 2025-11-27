import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/profile_screen.dart';

void main() {
  Widget _buildTestApp() {
    return const MaterialApp(
      home: ProfileScreen(),
    );
  }

  testWidgets('ProfileScreen shows title and input fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildTestApp());

    expect(find.text('Your Profile'), findsOneWidget);
    expect(find.byKey(const Key('profile_name_field')), findsOneWidget);
    expect(find.byKey(const Key('profile_email_field')), findsOneWidget);
    expect(find.byKey(const Key('profile_phone_field')), findsOneWidget);
    expect(find.byKey(const Key('profile_save_button')), findsOneWidget);
  });

  testWidgets('Tapping Save profile shows snack bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(_buildTestApp());

    await tester.tap(find.byKey(const Key('profile_save_button')));
    await tester.pump(); // pump to show SnackBar

    expect(
        find.text('Profile saved (not really, just a demo).'), findsOneWidget);
  });
}
