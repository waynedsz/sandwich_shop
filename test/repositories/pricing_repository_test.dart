import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    final pricing = PricingRepository();

    test('calculates price for a single six-inch sandwich', () {
      final price = pricing.calculatePrice(quantity: 1, isFootlong: false);
      expect(price, 7.00);
    });

    test('calculates price for multiple six-inch sandwiches', () {
      final price = pricing.calculatePrice(quantity: 2, isFootlong: false);
      expect(price, 14.00); // 2 × £7
    });

    test('calculates price for a single footlong sandwich', () {
      final price = pricing.calculatePrice(quantity: 1, isFootlong: true);
      expect(price, 11.00);
    });

    test('calculates price for multiple footlong sandwiches', () {
      final price = pricing.calculatePrice(quantity: 3, isFootlong: true);
      expect(price, 33.00); // 3 × £11
    });

    test('returns zero when quantity is zero', () {
      final price = pricing.calculatePrice(quantity: 0, isFootlong: true);
      expect(price, 0.00);
    });

    test('returns zero when quantity is negative (safety check)', () {
      final price = pricing.calculatePrice(quantity: -3, isFootlong: false);
      expect(price, 0.00);
    });
  });
}
