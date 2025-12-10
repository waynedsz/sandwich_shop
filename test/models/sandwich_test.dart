import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich Model', () {
    test('name getter returns correct display string', () {
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

    test('image getter returns correct asset path', () {
      final sixInch = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      expect(sixInch.image, 'assets/images/tunaMelt_six_inch.png');

      final footlong = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(footlong.image, 'assets/images/meatballMarinara_footlong.png');
    });

    test('supports all BreadType enum values', () {
      for (final bread in BreadType.values) {
        final s = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: bread,
        );
        expect(s.breadType, bread);
      }
    });

    test('supports all SandwichType values + correct names', () {
      final expected = {
        SandwichType.veggieDelight: 'Veggie Delight',
        SandwichType.chickenTeriyaki: 'Chicken Teriyaki',
        SandwichType.tunaMelt: 'Tuna Melt',
        SandwichType.meatballMarinara: 'Meatball Marinara',
      };

      for (final type in SandwichType.values) {
        final s = Sandwich(
          type: type,
          isFootlong: false,
          breadType: BreadType.white,
        );

        expect(s.type, type);
        expect(s.name, expected[type]);
      }
    });

    test('generates correct image for footlong', () {
      final s = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      expect(s.image, 'assets/images/chickenTeriyaki_footlong.png');
    });

    test('generates correct image for six inch', () {
      final s = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(s.image, 'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
