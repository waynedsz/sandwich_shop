import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  test('Sandwich name returns correct value', () {
    final sandwich = Sandwich(
      type: SandwichType.chickenTeriyaki,
      isFootlong: true,
      breadType: BreadType.white,
    );
    expect(sandwich.name, 'Chicken Teriyaki');
  });

  test('Sandwich image path is correct for footlong', () {
    final sandwich = Sandwich(
      type: SandwichType.veggieDelight,
      isFootlong: true,
      breadType: BreadType.wheat,
    );
    expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
  });

  test('Sandwich image path is correct for six inch', () {
    final sandwich = Sandwich(
      type: SandwichType.tunaMelt,
      isFootlong: false,
      breadType: BreadType.wholemeal,
    );
    expect(sandwich.image, 'assets/images/tunaMelt_six_inch.png');
  });
}
