enum BreadType { white, wheat, wholemeal }

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2e33822 (Update sandwich.dart)
enum SandwichType {
  veggieDelight,
  chickenTeriyaki,
  tunaMelt,
  meatballMarinara,
}

<<<<<<< HEAD
class Sandwich {
  final SandwichType type;
  final bool isFootlong;
  final BreadType breadType;

  Sandwich({
    required this.type,
    required this.isFootlong,
    required this.breadType,
  });

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

  String get image {
    String typeString = type.name;
    String sizeString = '';
    if (isFootlong) {
      sizeString = 'footlong';
    } else {
      sizeString = 'six_inch';
    }
    return 'assets/images/${typeString}_$sizeString.png';
  }
=======
=======
>>>>>>> 2e33822 (Update sandwich.dart)
class Sandwich {
  final SandwichType type;
  final bool isFootlong;
  final BreadType breadType;

  Sandwich({
    required this.type,
    required this.isFootlong,
    required this.breadType,
<<<<<<< HEAD
    required this.image,
<<<<<<< HEAD
  });
>>>>>>> e4ebb3a (Add Sandwich model)
=======
  }) {
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    if (image.isEmpty || !image.startsWith('assets/images/')) {
      throw ArgumentError('Image must be a valid asset path');
    }
  }
>>>>>>> 102d5a8 (📝 Add validation for Sandwich model parameters)
=======
  });

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

  String get image {
    String typeString = type.name;
    String sizeString = '';
    if (isFootlong) {
      sizeString = 'footlong';
    } else {
      sizeString = 'six_inch';
    }
    return 'assets/images/${typeString}_$sizeString.png';
  }
>>>>>>> 2e33822 (Update sandwich.dart)
=======
class Sandwich {
  final String name;
  final bool isFootlong;
  final BreadType breadType;
  final String image;

  Sandwich({
    required this.name,
    required this.isFootlong,
    required this.breadType,
    required this.image,
  });
>>>>>>> e4ebb3a (Add Sandwich model)
}
