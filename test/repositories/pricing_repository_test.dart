import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('calculates price for six-inch sandwiches', () {
      final repo = PricingRepository(isFootlong: false, quantity: 3);
      expect(repo.getTotalPrice(), 21); // 3 * £7
    });

    test('calculates price for footlong sandwiches', () {
      final repo = PricingRepository(isFootlong: true, quantity: 2);
      expect(repo.getTotalPrice(), 22); // 2 * £11
    });

    test('calculates price for zero quantity', () {
      final repo = PricingRepository(isFootlong: true, quantity: 0);
      expect(repo.getTotalPrice(), 0);
    });

    test('calculates price for six-inch sandwiches (alt)', () {
      final repo = PricingRepository(isFootlong: false, quantity: 2);
      expect(repo.getTotalPrice(), 14); // 2 * £7
    });

    test('calculates price for footlong sandwiches (alt)', () {
      final repo = PricingRepository(isFootlong: true, quantity: 3);
      expect(repo.getTotalPrice(), 33); // 3 * £11
    });
  });
}
