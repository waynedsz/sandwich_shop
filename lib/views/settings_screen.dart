import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> 67b8abe (Add a settings screen)
import 'package:sandwich_shop/views/app_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSize = 16.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
<<<<<<< HEAD
    await AppStyles.loadFontSize();
    setState(() {
      _fontSize = AppStyles.baseFontSize;
=======
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = 16.0;
      double? savedSize = prefs.getDouble('fontSize');
      
      if (savedSize != null) {
        _fontSize = savedSize;
      }

>>>>>>> 67b8abe (Add a settings screen)
      _isLoading = false;
    });
  }

  Future<void> _saveFontSize(double fontSize) async {
<<<<<<< HEAD
    await AppStyles.saveFontSize(fontSize);
=======
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
>>>>>>> 67b8abe (Add a settings screen)
    setState(() {
      _fontSize = fontSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        title: Text('Settings', style: AppStyles.heading1),
=======
        title: const Text('Settings', style: heading1),
>>>>>>> 67b8abe (Add a settings screen)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
<<<<<<< HEAD
          children: [
            Text('Font Size', style: AppStyles.heading2),
            const SizedBox(height: 20),
            Text(
              'Current size: ${_fontSize.toInt()}px',
=======
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Font Size', style: heading2),
            const SizedBox(height: 10),
            Text(
              'Current size: ${_fontSize.toInt()}',
>>>>>>> 67b8abe (Add a settings screen)
              style: TextStyle(fontSize: _fontSize),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _fontSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: _fontSize.toInt().toString(),
              onChanged: _saveFontSize,
            ),
<<<<<<< HEAD
            const SizedBox(height: 20),
            Text(
              'This is sample text to preview the font size.',
              style: TextStyle(fontSize: _fontSize),
            ),
            const SizedBox(height: 20),
            Text(
              'Font size changes are saved automatically. Restart the app to see changes in all screens.',
              style: AppStyles.normalText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to Order', style: AppStyles.normalText),
=======
            const SizedBox(height: 40),
            const Text(
              'This is sample text to preview the font size.',
              style: TextStyle(fontSize: 16),
>>>>>>> 67b8abe (Add a settings screen)
            ),
          ],
        ),
      ),
    );
  }
}
