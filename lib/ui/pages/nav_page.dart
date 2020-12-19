import 'package:flutter/material.dart';
import 'package:imvula/ui/pages/pages.dart';
import 'package:imvula/ui/res/colors.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    NotificationPage(),
    SettingPage(),
    HomePage(),
    ListingsPage(),
    SocialPage(),
  ];

  final Map<String, IconData> _icons = const {
    'Notification': Icons.notifications,
    'Setting': Icons.settings,
    'Home': Icons.home,
    'Listings': Icons.list,
    'Social': Icons.contact_mail,
  };

  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: _icons
              .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(icon, size: 30.0),
                    title: Text(title),
                  )))
              .values
              .toList(),
          currentIndex: _currentIndex,
          selectedItemColor: primaryColor,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.black45,
          unselectedFontSize: 11.0,
          onTap: (index) => setState(() => _currentIndex = index),
        ));
  }
}
