import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/PricingRepository.dart';

void main() {
  group('PricingRepository', () {
    test('Calculates price for six-inch sandwiches', () {
      final repo = PricingRepository(quantity: 2, isFootlong: false);
      expect(repo.getTotalPrice(), 14.0);
    });

    test('Calculates price for footlong sandwiches', () {
      final repo = PricingRepository(quantity: 3, isFootlong: true);
      expect(repo.getTotalPrice(), 33.0);
    });

    test('Returns 0 for quantity 0', () {
      final repo = PricingRepository(quantity: 0, isFootlong: true);
      expect(repo.getTotalPrice(), 0.0);
    });
  });
}
