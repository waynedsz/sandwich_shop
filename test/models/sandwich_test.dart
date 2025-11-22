import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('name returns correct string', () {
      expect(
        Sandwich(
                type: SandwichType.veggieDelight,
                isFootlong: false,
                breadType: BreadType.white)
            .name,
        'Veggie Delight',
      );
      expect(
        Sandwich(
                type: SandwichType.chickenTeriyaki,
                isFootlong: true,
                breadType: BreadType.wheat)
            .name,
        'Chicken Teriyaki',
      );
    });

    test('image returns correct asset path', () {
      final sandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      expect(sandwich.image, contains('tunaMelt_six_inch.png'));

      final sandwich2 = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(sandwich2.image, contains('meatballMarinara_footlong.png'));
    });
  });
}
