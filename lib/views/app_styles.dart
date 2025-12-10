import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStyles {
  static double _baseFontSize = 16.0;

  /// Loads saved font size from shared preferences.
  static Future<void> loadFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _baseFontSize = 16.0; // default

    if (prefs.containsKey('fontSize')) {
      final double? savedSize = prefs.getDouble('fontSize');
      if (savedSize != null && savedSize >= 10.0 && savedSize <= 30.0) {
        _baseFontSize = savedSize;
      }
    }
  }

  /// Saves new font size and updates runtime value.
  static Future<void> saveFontSize(double fontSize) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
    _baseFontSize = fontSize;
  }

  static double get baseFontSize => _baseFontSize;

  // Dynamic text styles
  static TextStyle get normalText => TextStyle(
        fontSize: _baseFontSize,
      );

  static TextStyle get heading1 => TextStyle(
        fontSize: _baseFontSize + 8,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get heading2 => TextStyle(
        fontSize: _baseFontSize + 4,
        fontWeight: FontWeight.bold,
      );
}

// Backwards compatibility for old code
TextStyle get normalText => AppStyles.normalText;
TextStyle get heading1 => AppStyles.heading1;
TextStyle get heading2 => AppStyles.heading2;
