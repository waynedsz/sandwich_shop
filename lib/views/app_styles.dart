import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< HEAD
const TextStyle normalText = TextStyle(
  fontSize: 16,
<<<<<<< HEAD
<<<<<<< HEAD
);
=======
class AppStyles {
  static double _baseFontSize = 16.0;
>>>>>>> 1bd25d9 (update app_styles.dart to load font sizes)
=======
import 'package:shared_preferences/shared_preferences.dart';

class AppStyles {
  static double _baseFontSize = 16.0;
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)

  static Future<void> loadFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _baseFontSize = prefs.getDouble('fontSize') ?? 16.0;
  }

<<<<<<< HEAD
<<<<<<< HEAD
const heading2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
=======
=======
>>>>>>> cdd80e0 (Move UIs to views)
=======

const TextStyle normalText = TextStyle(
  fontSize: 16,
>>>>>>> cdd80e0 (Move UIs to views)
  fontWeight: FontWeight.bold,
);

const Heading1 = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> cdd80e0 (Move UIs to views)
=======
>>>>>>> cdd80e0 (Move UIs to views)
=======
=======
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)
  static Future<void> saveFontSize(double fontSize) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
    _baseFontSize = fontSize;
  }

  static double get baseFontSize => _baseFontSize;

  static TextStyle get normalText => TextStyle(fontSize: _baseFontSize);

  static TextStyle get heading1 => TextStyle(
        fontSize: _baseFontSize + 8,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get heading2 => TextStyle(
        fontSize: _baseFontSize + 4,
        fontWeight: FontWeight.bold,
      );
}

<<<<<<< HEAD
<<<<<<< HEAD
TextStyle get normalText => AppStyles.normalText;
TextStyle get heading1 => AppStyles.heading1;
TextStyle get heading2 => AppStyles.heading2;
>>>>>>> 1bd25d9 (update app_styles.dart to load font sizes)
=======
>>>>>>> cdd80e0 (Move UIs to views)
=======
// Keep these for backward compatibility, but they now use the dynamic styles
=======
>>>>>>> d49ab6e (Remove comments from app styles)
TextStyle get normalText => AppStyles.normalText;
TextStyle get heading1 => AppStyles.heading1;
TextStyle get heading2 => AppStyles.heading2;
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)
