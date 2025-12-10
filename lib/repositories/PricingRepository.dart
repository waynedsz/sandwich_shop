// ignore_for_file: file_names

class PricingRepository {
  final int quantity;
  final bool isFootlong;

  PricingRepository({
    required this.quantity,
    required this.isFootlong,
  });

  /// Returns the total price for the current order.
  double getTotalPrice() {
    final pricePerSandwich = isFootlong ? 11.0 : 7.0;
    return pricePerSandwich * quantity;
  }
}
