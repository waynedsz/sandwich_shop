import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';

void main() {
  group('PricingRepository', () {
    test('returns correct price for single six-inch', () {
      final price =
          PricingRepository(quantity: 1, isFootlong: false).getTotalPrice();
      expect(price, 7.00);
    });

    test('returns correct price for multiple six-inch', () {
      final price =
          PricingRepository(quantity: 2, isFootlong: false).getTotalPrice();
      expect(price, 14.00);
    });

    test('returns correct price for single footlong', () {
      final price =
          PricingRepository(quantity: 1, isFootlong: true).getTotalPrice();
      expect(price, 11.00);
    });

    test('returns correct price for multiple footlongs', () {
      final price =
          PricingRepository(quantity: 3, isFootlong: true).getTotalPrice();
      expect(price, 33.00);
    });

    test('returns zero when quantity is zero', () {
      final price =
          PricingRepository(quantity: 0, isFootlong: true).getTotalPrice();
      expect(price, 0.00);
    });

    test('returns zero for negative quantities (edge case)', () {
      final price =
          PricingRepository(quantity: -5, isFootlong: false).getTotalPrice();
      expect(price, 0.00);
    });
  });
}
