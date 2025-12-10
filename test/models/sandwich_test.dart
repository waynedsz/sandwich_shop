import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich Model', () {
    test('name returns correct human-readable sandwich name', () {
      expect(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: false,
          breadType: BreadType.white,
        ).name,
        'Veggie Delight',
      );

      expect(
        Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        ).name,
        'Chicken Teriyaki',
      );
    });

    test('image returns correct asset path', () {
      final sandwich1 = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );

      expect(
        sandwich1.image,
        'assets/images/tunaMelt_six_inch.png',
      );

      final sandwich2 = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(
        sandwich2.image,
        'assets/images/meatballMarinara_footlong.png',
      );
    });

    test('all SandwichType enum values produce correct names', () {
      final expectedNames = {
        SandwichType.veggieDelight: 'Veggie Delight',
        SandwichType.chickenTeriyaki: 'Chicken Teriyaki',
        SandwichType.tunaMelt: 'Tuna Melt',
        SandwichType.meatballMarinara: 'Meatball Marinara',
      };

      for (final type in SandwichType.values) {
        final sandwich = Sandwich(
          type: type,
          isFootlong: false,
          breadType: BreadType.white,
        );

        expect(sandwich.name, expectedNames[type]);
      }
    });

    test('all BreadType enum values are supported', () {
      for (final bread in BreadType.values) {
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: true,
          breadType: bread,
        );

        expect(sandwich.breadType, bread);
      }
    });

    test('equality: sandwiches with same properties are equal', () {
      final s1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      final s2 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(s1, equals(s2));
      expect(s1.hashCode, equals(s2.hashCode));
    });

    test('equality: sandwiches with different properties are not equal', () {
      final s1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );

      final s2 = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.white,
      );

      expect(s1 == s2, isFalse);
    });
  });
}
