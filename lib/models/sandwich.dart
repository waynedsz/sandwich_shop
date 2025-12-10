enum BreadType { white, wheat, wholemeal }

enum SandwichType {
  veggieDelight,
  chickenTeriyaki,
  tunaMelt,
  meatballMarinara,
}

class Sandwich {
  final SandwichType type;
  final bool isFootlong;
  final BreadType breadType;

  Sandwich({
    required this.type,
    required this.isFootlong,
    required this.breadType,
  });

  /// Human-readable sandwich name
  String get name {
    switch (type) {
      case SandwichType.veggieDelight:
        return 'Veggie Delight';
      case SandwichType.chickenTeriyaki:
        return 'Chicken Teriyaki';
      case SandwichType.tunaMelt:
        return 'Tuna Melt';
      case SandwichType.meatballMarinara:
        return 'Meatball Marinara';
    }
  }

  /// Image path based on type + size
  String get image {
    final typeString = type.name;
    final sizeString = isFootlong ? 'footlong' : 'six_inch';
    return 'assets/images/${typeString}_$sizeString.png';
  }

  /// Required so Sandwich can be used as a Map key
  @override
  bool operator ==(Object other) {
    return other is Sandwich &&
        type == other.type &&
        isFootlong == other.isFootlong &&
        breadType == other.breadType;
  }

  @override
  int get hashCode => Object.hash(type, isFootlong, breadType);
}
