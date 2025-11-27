import 'package:flutter/material.dart';

class NavigationScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const NavigationScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  static const _drawerKey = Key('main_navigation_drawer');
  static const _railKey = Key('main_navigation_rail');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool useDrawer = width < 600;

    if (useDrawer) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: _MainDrawer(
          drawerKey: _drawerKey,
        ),
        body: body,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Row(
        children: [
          NavigationRail(
            key: _railKey,
            selectedIndex:
                _selectedIndexForRoute(ModalRoute.of(context)?.settings.name),
            onDestinationSelected: (index) {
              _navigateByIndex(context, index);
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.fastfood),
                label: Text('Order'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info),
                label: Text('About'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('Profile'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: body),
        ],
      ),
    );
  }

  int _selectedIndexForRoute(String? routeName) {
    switch (routeName) {
      case '/about':
        return 1;
      case '/profile':
        return 2;
      case '/':
      default:
        return 0;
    }
  }

  void _navigateByIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        _goTo(context, '/');
        break;
      case 1:
        _goTo(context, '/about');
        break;
      case 2:
        _goTo(context, '/profile');
        break;
    }
  }

  void _goTo(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name == route) return;
    Navigator.of(context).pushReplacementNamed(route);
  }
}

class _MainDrawer extends StatelessWidget {
  final Key drawerKey;

  const _MainDrawer({
    required this.drawerKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';

    Widget buildItem({
      required IconData icon,
      required String label,
      required String route,
      required Key key,
    }) {
      final bool selected = currentRoute == route;
      return ListTile(
        leading: Icon(icon),
        title: Text(label),
        selected: selected,
        key: key,
        onTap: () {
          Navigator.of(context).pop();
          if (!selected) {
            Navigator.of(context).pushReplacementNamed(route);
          }
        },
      );
    }

    return Drawer(
      key: drawerKey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Sandwich Shop',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          buildItem(
            icon: Icons.fastfood,
            label: 'Order',
            route: '/',
            key: const Key('drawer_nav_order'),
          ),
          buildItem(
            icon: Icons.info,
            label: 'About',
            route: '/about',
            key: const Key('drawer_nav_about'),
          ),
          buildItem(
            icon: Icons.person,
            label: 'Profile',
            route: '/profile',
            key: const Key('drawer_nav_profile'),
          ),
        ],
      ),
    );
  }
}
