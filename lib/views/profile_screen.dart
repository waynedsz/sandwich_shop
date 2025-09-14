import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:sandwich_shop/widgets/navigation_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationScaffold(
      title: 'Your Profile',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const TextField(
              key: Key('profile_name_field'),
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              key: Key('profile_email_field'),
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              key: Key('profile_phone_field'),
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: const Key('profile_save_button'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profile saved'),
                    ),
                  );
                },
                child: const Text('Save profile'),
              ),
=======
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_shop/models/cart.dart';
=======
import 'package:sandwich_shop/views/app_styles.dart';
>>>>>>> 4aae054 (Add the link to the profile)
=======
import 'package:provider/provider.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/models/cart.dart';
>>>>>>> 2889716 (Show the cart icon)

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    final String name = _nameController.text.trim();
    final String location = _locationController.text.trim();

    final bool nameIsNotEmpty = name.isNotEmpty;
    final bool locationIsNotEmpty = location.isNotEmpty;
    final bool bothFieldsFilled = nameIsNotEmpty && locationIsNotEmpty;

    if (bothFieldsFilled) {
      _returnProfileData(name, location);
    } else {
      _showValidationError();
    }
  }

  void _returnProfileData(String name, String location) {
    final Map<String, String> profileData = {
      'name': name,
      'location': location,
    };
    Navigator.pop(context, profileData);
  }

  void _showValidationError() {
    const SnackBar validationSnackBar = SnackBar(
      content: Text('Please fill in all fields'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(validationSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 2889716 (Show the cart icon)
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
<<<<<<< HEAD
<<<<<<< HEAD
        title: Text(
=======
        title: const Text(
>>>>>>> 2889716 (Show the cart icon)
=======
        title: Text(
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)
          'Profile',
          style: heading1,
        ),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
<<<<<<< HEAD
<<<<<<< HEAD
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 4),
=======
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 4),
>>>>>>> 2889716 (Show the cart icon)
=======
                    const Icon(Icons.shopping_cart),
                    const SizedBox(width: 4),
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)
                    Text('${cart.countOfItems}'),
                  ],
                ),
              );
            },
          ),
        ],
<<<<<<< HEAD
=======
        title: const Text('Profile', style: heading1),
>>>>>>> 4aae054 (Add the link to the profile)
=======
>>>>>>> 2889716 (Show the cart icon)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
<<<<<<< HEAD
<<<<<<< HEAD
            Text('Enter your details:', style: heading2),
=======
            const Text('Enter your details:', style: heading2),
>>>>>>> 4aae054 (Add the link to the profile)
=======
            Text('Enter your details:', style: heading2),
>>>>>>> d52fe62 (Pull font sizes from shared_preference and remove consts from app_style usages)
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Preferred Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: const Text('Save Profile'),
<<<<<<< HEAD
>>>>>>> 4aae054 (Add the link to the profile)
=======
>>>>>>> 4aae054 (Add the link to the profile)
            ),
          ],
        ),
      ),
    );
  }
}
