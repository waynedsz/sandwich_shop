import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich', () {
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    test('should create a Sandwich with correct properties', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, isTrue);
      expect(sandwich.breadType, BreadType.wholemeal);
      expect(sandwich.name, 'Veggie Delight');
      expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('should support all BreadType enum values', () {
      for (final BreadType bread in BreadType.values) {
        final Sandwich sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: bread,
=======
    test('should create a Sandwich with correct properties', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, isTrue);
      expect(sandwich.breadType, BreadType.wholemeal);
      expect(sandwich.name, 'Veggie Delight');
      expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('should support all BreadType enum values', () {
      for (final BreadType bread in BreadType.values) {
        final Sandwich sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: bread,
<<<<<<< HEAD
          image: 'assets/images/test.png',
>>>>>>> d01b10f (Add unit test for sandwich)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
=======
    test('should create a Sandwich with correct properties', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, isTrue);
      expect(sandwich.breadType, BreadType.wholemeal);
      expect(sandwich.name, 'Veggie Delight');
      expect(sandwich.image, 'assets/images/veggieDelight_footlong.png');
    });

    test('should support all BreadType enum values', () {
      for (final BreadType bread in BreadType.values) {
        final sandwich = Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: bread,
<<<<<<< HEAD
          image: 'assets/images/test.png',
>>>>>>> d01b10f (Add unit test for sandwich)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
        );
        expect(sandwich.breadType, bread);
      }
    });

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
    test('should support all SandwichType enum values and correct names', () {
      final Map<SandwichType, String> expectedNames = {
        SandwichType.veggieDelight: 'Veggie Delight',
        SandwichType.chickenTeriyaki: 'Chicken Teriyaki',
        SandwichType.tunaMelt: 'Tuna Melt',
        SandwichType.meatballMarinara: 'Meatball Marinara',
      };
      for (final SandwichType type in SandwichType.values) {
        final Sandwich sandwich = Sandwich(
          type: type,
<<<<<<< HEAD
<<<<<<< HEAD
          isFootlong: false,
          breadType: BreadType.white,
        );
        expect(sandwich.type, type);
        expect(sandwich.name, expectedNames[type]);
      }
    });

    test('should generate correct image path for footlong', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      expect(sandwich.image, 'assets/images/chickenTeriyaki_footlong.png');
    });

    test('should generate correct image path for six inch', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(sandwich.image, 'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
<<<<<<< HEAD
>>>>>>> d01b10f (Add unit test for sandwich)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
=======
=======
>>>>>>> d01b10f (Add unit test for sandwich)
    test('should handle isFootlong true and false', () {
      final footlong = Sandwich(
        name: 'Footlong',
        isFootlong: true,
        breadType: BreadType.white,
        image: 'assets/images/footlong.png',
      );
      final sixInch = Sandwich(
        name: 'Six Inch',
        isFootlong: false,
        breadType: BreadType.white,
        image: 'assets/images/six-inch.png',
      );

      expect(footlong.isFootlong, isTrue);
      expect(sixInch.isFootlong, isFalse);
    });

    test('should throw if name is empty', () {
      expect(
        () => Sandwich(
          name: '',
<<<<<<< HEAD
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
          isFootlong: false,
          breadType: BreadType.white,
        );
        expect(sandwich.type, type);
        expect(sandwich.name, expectedNames[type]);
      }
    });

    test('should generate correct image path for footlong', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      expect(sandwich.image, 'assets/images/chickenTeriyaki_footlong.png');
    });

    test('should generate correct image path for six inch', () {
      final Sandwich sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(sandwich.image, 'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
<<<<<<< HEAD
>>>>>>> d01b10f (Add unit test for sandwich)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
=======
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
          isFootlong: false,
          breadType: BreadType.white,
        );
        expect(sandwich.type, type);
        expect(sandwich.name, expectedNames[type]);
      }
    });

    test('should generate correct image path for footlong', () {
      final sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.wheat,
      );
      expect(sandwich.image, 'assets/images/chickenTeriyaki_footlong.png');
    });

    test('should generate correct image path for six inch', () {
      final sandwich = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(sandwich.image, 'assets/images/meatballMarinara_six_inch.png');
    });
  });
}
<<<<<<< HEAD
>>>>>>> d01b10f (Add unit test for sandwich)
=======
>>>>>>> 2471fd2 (Update the sandwich test accordingly)
